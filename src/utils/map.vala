using Carol.Utils.Render;
using Carol.Utils.Assets;
using Carol.Utils.Math;

namespace Carol.Utils.Maps {  

    public class Map {
        private static Renderer static_renderer;
        private Renderer renderer;
        private Tmx.Map? map;

        public float scale {
            get; set;
            default = 1.0f;
        }
        public uint width { get { return ((!) map).width; } }
        public uint height { get { return ((!) map).height; } }
        public uint tile_width { get { return ((!) map).tile_width; } }
        public uint tile_height { get { return ((!) map).tile_height; } }

        public Map(
            Renderer renderer, 
            string path
        ) throws AssetError {
            static_renderer = renderer;
            this.renderer = renderer;
            
            Tmx.img_load_func = (img_path) => {
                SDL.Surface.Surface? surface = SDL.Surface.load_png(img_path);
                if (surface == null) {
                    return null;
                }
                SDL.Render.Texture? texture = SDL.Render.create_texture_from_surface(
                    static_renderer.sdl, 
                    (!) surface
                );

                if (texture != null) {
                    SDL.Render.set_texture_scale_mode(
                        (!) texture, 
                        TextureFilter.NEAREST.to_scale_mode()
                    );
                }

                SDL.Surface.destroy_surface((!) surface);
                return (void*) texture;
            };
            Tmx.img_free_func = (texture) => {
                if (texture != null) {
                    SDL.Render.destroy_texture((SDL.Render.Texture*) texture);
                }
            };

            Tmx.Map? maybe_map = new Tmx.Map(path);         
            
            if (maybe_map == null) {
                throw AssetError.invalid_tmx_map(path);
            }
            
            map = (owned) maybe_map;
        }

        public bool is_solid(Vector2 pos, string layer_name) {
            unowned Tmx.Layer? head_layer = ((!) map).ly_head;
            bool found = false;
            while (head_layer != null) {
                unowned var head = (!) head_layer;
                if (head.name != null && ((!) head.name) == layer_name) {
                    found = true;
                    break;
                }
                head_layer = head.next;
            }

            if (!found) {
                Debug.error("Layer `"+layer_name+"` not found");
                return false;
            }

            uint tile_x = (uint)(pos.x / (((!) map).tile_width * scale));
            uint tile_y = (uint)(pos.y / (((!) map).tile_height * scale));

            if (tile_x >= ((!) map).width || tile_y >= ((!) map).height) {
                return false;
            }

            uint gid = ((!) head_layer).content_gids[(tile_y * ((!) map).width) + tile_x] & Tmx.FLIP_BITS_REMOVAL;
            return gid != 0 && ((!) map).tiles[gid] != null;
        }

        public void render_collision(string layer_name) {
            for (int x = 0; x < width; x++) {
                for (int y = 0; y < height; y++) {
                    if (is_solid(Vector2(x * tile_width * scale, y * tile_height * scale), layer_name)) {
                        var rect = SDL.Rect.FRect() {
                            x = x * tile_width * scale,
                            y = y * tile_height * scale,
                            w = tile_width * scale,
                            h = tile_height * scale
                        };
                        SDL.Render.set_render_draw_color(renderer.sdl, 0, 0, 200, 255);
                        SDL.Render.render_rect(renderer.sdl, rect);
                    }
                }
            }
        }

        public void render_full() {
            set_background_color(((!) map).backgroundcolor);
            SDL.Render.render_clear(renderer.sdl);

            draw_all_layers(((!) map).ly_head);
        }

        public void render_layer(string layer_name) {
            unowned Tmx.Layer? head_layer = ((!) map).ly_head;
            bool found = false;
            while (head_layer != null) {
                unowned var head = (!) head_layer;
                Debug.trace("Checking layer `"+(head.name != null ? (!) head.name : "unknown")+"`");
                if (head.name != null && ((!) head.name) == layer_name) {
                    found = true;
                    draw_layer(head);
                    break;
                }
                head_layer = head.next;
            }

            if (!found) {
                Debug.error("Layer `"+layer_name+"` not found");
            }
        }

        private void draw_all_layers(Tmx.Layer? head_layer) {
            while (head_layer != null) {
                unowned var head = (!) head_layer;
                if (head.visible) {
                    switch (head.type) {
                        case Tmx.LayerType.GROUP:
                            draw_all_layers(head.content_group_head);
                            break;

                        case Tmx.LayerType.OBJGR:
                            draw_objects((!) head.content_objgr);
                            break;

                        case Tmx.LayerType.IMAGE:
                            draw_image_layer((!) head.content_image);
                            break;

                        case Tmx.LayerType.LAYER:
                            draw_layer(head);
                            break;

                        default: break;
                    }
                }
                head_layer = head.next;
            }
        }

        private void draw_layer(Tmx.Layer head) {
            ulong i, j;
            uint gid, x, y, w, h, flags;
            float op;
            unowned Tmx.TileSet tile_set;
            unowned Tmx.Image? image;
            SDL.Render.Texture* texture;
            op = (float) head.opacity;

            for (i = 0; i < ((!) map).height; i++) {
                for (j = 0; j < ((!) map).width; j++) {
                    gid = head.content_gids[(i * ((!) map).width) + j] & Tmx.FLIP_BITS_REMOVAL;
                    if (((!) map).tiles[gid] != null) {
                        var tile = ((!) map).tiles[gid];
                        tile_set = (!) tile->tileset;
                        image = tile->image;
                        x = tile->ul_x;
                        y = tile->ul_y;
                        w = tile_set.tile_width;
                        h = tile_set.tile_height;

                        if (image != null) {
                            texture = ((!) image).resource_image;
                        } else {
                            texture = ((!) tile_set.image).resource_image;
                        }
                        flags = head.content_gids[(i * ((!) map).width) + j] & ~Tmx.FLIP_BITS_REMOVAL;

                        draw_tile(
                            texture, 
                            x, y, 
                            w, h, 
                            (uint)(j * tile_set.tile_width), 
                            (uint)(i * tile_set.tile_height), 
                            op, 
                            flags
                        );
                    }
                }
            }
        }

        void draw_tile(
            SDL.Render.Texture* texture, 
            uint sx, 
            uint sy, 
            uint sw, 
            uint sh,
            uint dx, 
            uint dy, 
            float opacity, 
            uint flags
        ) {
            var src_rect = SDL.Rect.FRect();
            var dst_rect = SDL.Rect.FRect();
            src_rect.x = sx;
            src_rect.y = sy;
            src_rect.w = dst_rect.w = sw;
            src_rect.h = dst_rect.h = sh;
            dst_rect.x = dx * scale;
            dst_rect.y = dy * scale;
            dst_rect.w *= scale;
            dst_rect.h *= scale;

            SDL.Render.render_texture(
                renderer.sdl,
                texture,
                src_rect,
                dst_rect
            );
        }

        private void draw_image_layer(Tmx.Image image) {
            SDL.Rect.FRect dim = { x: 0, y: 0 };

            SDL.Render.Texture texture = (SDL.Render.Texture) image.resource_image;
            SDL.Render.render_texture(renderer.sdl, texture, null, dim);
        }

        private void draw_objects(Tmx.ObjectGroup object_group) {
            set_background_color(object_group.color);

            unowned Tmx.Object? head_object = object_group.head;
            var rect = SDL.Rect.FRect();

            while (head_object != null) {
                unowned var head = (!) head_object;

                if (head.visible) {
                    switch (head.obj_type) {
                        case Tmx.ObjType.SQUARE:
                            rect.x = (float) head.x;
                            rect.y = (float) head.y;
                            rect.w = (float) head.width;
                            rect.h = (float) head.height;
                            SDL.Render.render_rect(renderer.sdl, rect);
                            break;
                            
                        case Tmx.ObjType.POLYGON:
                            unowned var shape = (!) head.content_shape;
                            draw_polygon(
                                shape.points, 
                                head.x, 
                                head.y,
                                shape.points_len
                            );
                            break;

                        case Tmx.ObjType.POLYLINE:
                            unowned var shape = (!) head.content_shape;
                            draw_polyline(
                                shape.points, 
                                head.x, 
                                head.y,
                                shape.points_len
                            );
                            break;

                        default: break;
                    }
                }
                head_object = head.next;
            }
        }

        private void draw_polyline(double **points, double x, double y, int len) {
            for (int i = 1; i < len; i++) {
                SDL.Render.render_line(
                    renderer.sdl, 
                    (float) (x+points[i-1][0]),
                    (float) (y+points[i-1][1]),
                    (float) (x+points[i][0]),
                    (float) (y+points[i][1])
                );
            }
        }

        private void draw_polygon(double** points, double x, double y, int len) {
            draw_polyline(points, x, y, len);
            if (len > 2) {
                SDL.Render.render_line(
                    renderer.sdl, 
                    (float) (x+points[0][0]), 
                    (float) (y+points[0][1]), 
                    (float) (x+points[len-1][0]),
                    (float) (y+points[len-1][1])
                );
            }
        }

        private void set_background_color(uint32 color) {
            Tmx.ColBytes col = Tmx.col_to_bytes(color);
            SDL.Render.set_render_draw_color(renderer.sdl, col.r, col.g, col.b, col.a);
        }
    }

    public class Node : Object {
        public MapCoord coord { get; }
        public Node parent { get; }
        public float g { get; }
        public float f { get; }

        public Node(MapCoord coord, Node parent, float g, float f) {
            Object(
                coord: coord, 
                parent: parent, 
                g: g, 
                f: f
            );
        }
    }

    public struct MapCoord {
        public int x;
        public int y;

        public MapCoord(int x, int y) {
            this.x = x;
            this.y = y;
        }

        public static MapCoord[] directions() {
            return {
                MapCoord(1, 0),  // Right
                MapCoord(0, 1),  // Up
                MapCoord(-1, 0), // Left
                MapCoord(0, -1)  // Down
            };
        }
    }
}
