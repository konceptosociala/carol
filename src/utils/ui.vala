using SDL.Pixels;

using Carol.Screens;
using Carol.Utils.Render;

namespace Carol.Utils {
    
    public class UIManager {
        private const float SCALE = 4.0f;

        private Renderer renderer;

        public UIManager(Renderer renderer) {
            this.renderer = renderer;
        }

        public void menu_button(
            int screenWidth,
            int screenHeight,
            int centerOffset, 
            MainMenuButton self,
            MainMenuButton current
        ) {
            SDL.Render.set_render_scale(renderer.sdl, SCALE, SCALE);

            if (self == current) {
                SDL.Render.set_render_draw_color(renderer.sdl, 255, 255, 255, ALPHA_OPAQUE);
            } else {
                SDL.Render.set_render_draw_color(renderer.sdl, 128, 128, 128, ALPHA_OPAQUE);
            }

            SDL.Render.render_debug_text(
                renderer.sdl, 
                screenWidth / 2 / (int) SCALE - 50, 
                screenHeight / 2 / (int) SCALE + centerOffset, 
                self.toString()
            );

            SDL.Render.set_render_scale(renderer.sdl, 1.0f, 1.0f);
        }
    }
}