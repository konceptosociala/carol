using SDL.FileSystem;
using SDL.Surface;

using Carol.Utils.Render;

namespace Carol.Utils.Assets {

    public class Texture {
        public SDL.Render.Texture inner { get; private set; }
        public int width { get; private set; }
        public int height { get; private set; }

        public Texture(Renderer renderer, string asset_path) throws AssetError {
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
            SDL.Render.set_texture_scale_mode(inner, SDL.Surface.ScaleMode.NEAREST);

            destroy_surface(surface);
        }
    }

    public errordomain AssetError {
        ASSET_NOT_EXIST,
        INVALID_PNG_TEXTURE;

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