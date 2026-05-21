using SDL.FileSystem;
using SDL.Surface;

using Carol.Utils.Render;
using Carol.Utils.Math;

namespace Carol.Utils.Assets {

    public enum TextureFilter {
        NEAREST,
        LINEAR;

        public SDL.Surface.ScaleMode to_scale_mode() {
            switch (this) {
                case TextureFilter.NEAREST: 
                    return SDL.Surface.ScaleMode.NEAREST;
                case TextureFilter.LINEAR: 
                    return SDL.Surface.ScaleMode.LINEAR;
            }

            assert_not_reached();
        }
    }

    public class Texture {
        public SDL.Render.Texture inner { get; private set; }
        public int width { get; private set; }
        public int height { get; private set; }
        public int? tile_width { get; private set; }
        public int? tile_height { get; private set; }

        public Texture(
            Renderer renderer, 
            string asset_path, 
            TextureFilter filter = TextureFilter.LINEAR
        ) throws AssetError {
            string path = get_asset_path(asset_path);
            if (!FileUtils.test(path, FileTest.EXISTS)) {
                throw AssetError.asset_not_exist(path);
            }

            Surface? png = load_png(path);
            if (png == null) {
                throw AssetError.invalid_png_texture(path);
            }

            Surface surface = (!) png;

            width = surface.w;
            height = surface.h;

            SDL.Render.Texture? maybe = SDL.Render.create_texture_from_surface(renderer.sdl, surface);
            if (maybe == null) {
                throw AssetError.invalid_png_texture(path);
            }

            inner = (!) maybe;
            SDL.Render.set_texture_scale_mode(inner, filter.to_scale_mode());

            destroy_surface(surface);
        }

        public Texture.with_tiles(
            Renderer renderer, 
            string asset_path,
            int tile_width,
            int tile_height,
            TextureFilter filter = TextureFilter.LINEAR
        ) throws AssetError {
            this(renderer, asset_path, filter);

            this.tile_width = tile_width;
            this.tile_height = tile_height;
        }

        public void render(
            Renderer renderer, 
            Vector2 position,
            float scale,
            TileCoord? maybe_tile_coord
        ) throws AssetError {
            if (maybe_tile_coord != null) {
                TileCoord tile_coord = (!) maybe_tile_coord;
                if (tile_width == null || tile_height == null) {
                    throw AssetError.texture_not_tiled(tile_coord);
                }

                int tw = (!) tile_width, th = (!) tile_height;
                var src_rect = SDL.Rect.FRect() {
                    x = tile_coord.x * tw,
                    y = tile_coord.y * th,
                    w = (float) tw,
                    h = (float) th
                };
                var dst_rect = SDL.Rect.FRect() {
                    x = position.x,
                    y = position.y,
                    w = (float) tw * scale,
                    h = (float) th * scale
                };
                SDL.Render.render_texture(renderer.sdl, inner, src_rect, dst_rect);
            } else {
                var dst_rect = SDL.Rect.FRect() {
                    x = position.x,
                    y = position.y,
                    w = (float) width * scale,
                    h = (float) height * scale
                };
                SDL.Render.render_texture(renderer.sdl, inner, null, dst_rect);
            }
        }
    }

    public struct TileCoord {
        public int x;
        public int y;

        public TileCoord(int x, int y) {
            this.x = x;
            this.y = y;
        }
    }

    public errordomain AssetError {
        ASSET_NOT_EXIST,
        INVALID_PNG_TEXTURE,
        TEXTURE_NOT_TILED;

        public static AssetError asset_not_exist(string asset_path) {
            return new AssetError.ASSET_NOT_EXIST(
                "Asset does not exist: \"%s\"".printf(asset_path)
            );
        }

        public static AssetError invalid_png_texture(string asset_path) {
            return new AssetError.INVALID_PNG_TEXTURE(
                "Invalid PNG texture: \"%s\"".printf(asset_path)
            );
        }

        public static AssetError texture_not_tiled(TileCoord tile_coord) {
            return new AssetError.TEXTURE_NOT_TILED(
                "Trying to perform tiled rendering on solid texture with coords: (%d, %d)"
                    .printf(tile_coord.x, tile_coord.y)
            );
        }
    }

    public string get_asset_path(string relative_path) {
        string? base_path = get_base_path();

        if (base_path == null) {
            Debug.error("Cannot retrieve base path, asset cannot be loaded: "+relative_path);
            return "";
        }

        return Path.build_filename((!) base_path, "../assets", relative_path);
    }


}