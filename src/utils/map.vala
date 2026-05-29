using Carol.Utils.Render;
using Carol.Utils.Assets;

namespace Carol.Utils.Maps {  

    public class Map {
        private static Renderer static_renderer;
        private Renderer renderer;
        private Tmx.Map map;

        public uint width { get { return map.width; } }
        public uint height { get { return map.height; } }
        public uint tile_width { get { return map.tile_width; } }
        public uint tile_height { get { return map.tile_height; } }

        public Map(Renderer renderer, string path) throws Error {
            static_renderer = renderer;
            this.renderer;
            
            Tmx.img_load_func = (img_path) => {
                return (void*) SDL.Image.load_texture(static_renderer.sdl, img_path);
            };
            Tmx.img_free_func = (texture) => {
                if (texture != null) {
                    SDL.Render.destroy_texture((SDL.Render.Texture*) texture);
                }
            };

            map = new Tmx.Map(path);            
        }

        public bool is_solid(float x, float y) {
            return false;
        }

        public void render() {
            set_background_color(map.backgroundcolor);
            SDL.Render.render_clear(renderer.sdl);

            draw_all_layers(map.ly_head);
        }

        private void draw_all_layers(Tmx.Layer? head_layer) {
            while (head_layer != null) {
                var head = (!) head_layer;
                if (head.visible) {
                    switch (head.type) {
                        case Tmx.LayerType.GROUP:
                            draw_all_layers(head.content_group_head);
                            break;

                        case Tmx.LayerType.OBJGR:
                            draw_objects((!) head.content_objgr);
                            break;

                        case Tmx.LayerType.IMAGE:
                            draw_image_layer(head.content_image);
                            break;

                        case Tmx.LayerType.LAYER:
                            draw_layer(head);
                            break;
                    }
                }
                head_layer = head.next;
            }
        }

        private void draw_objects(Tmx.ObjectGroup object_group) {
            set_background_color(object_group.color);

            Tmx.Object? head_object = object_group.head;
            SDL.Rect.FRect rect;

            while (head_object != null) {
                var head = (!) head_object;

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
                            var shape = (!) head.content_shape;
                            draw_polygon(
                                shape.points, 
                                head.x, 
                                head.y,
                                shape.points_len
                            );
                            break;

                        case Tmx.ObjType.POLYLINE:
                            var shape = (!) head.content_shape;
                            draw_polyline(
                                shape.points, 
                                head.x, 
                                head.y,
                                shape.points_len
                            );
                            break;

                        case Tmx.ObjType.ELLIPSE:
                            // ¯\_(ツ)_/¯
                            break;
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
