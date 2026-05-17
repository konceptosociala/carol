using Carol.Utils.Assets;
using Carol.Utils.Render;
using Carol.Utils;

namespace Carol.Screens {

    public class GameScreen : Screen {
        private Renderer renderer;
        private Texture texture;

        public GameScreen(Renderer renderer) {
            this.renderer = renderer;
        }

        public override void init() {
            try {
                texture = new Texture(renderer, "anim/carol.png");
            } catch (AssetError e) {
                Debug.error(e.message);
            }
        }

        public override void render(float dt) {
            float scale = ((float) (((int) (dt % 1000)) - 500) / 500.0f);
            var dst_rect = SDL.Rect.FRect();

            dst_rect.x = 0.0f;
            dst_rect.y = 0.0f;
            dst_rect.w = (float) texture.width *2;
            dst_rect.h = (float) texture.height *2;
            SDL.Render.render_texture(renderer.sdl, texture.inner, null, dst_rect);
        }
    }
}