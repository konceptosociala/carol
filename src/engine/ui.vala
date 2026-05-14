using SDL.Render;
using SDL.Pixels;

namespace Engine {
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
            set_render_scale(renderer, SCALE, SCALE);

            if (self == current) {
                set_render_draw_color(this.renderer, 255, 255, 255, ALPHA_OPAQUE);
            } else {
                set_render_draw_color(this.renderer, 128, 128, 128, ALPHA_OPAQUE);
            }

            render_debug_text(
                this.renderer, 
                screenWidth / 2 / (int) SCALE - 50, 
                screenHeight / 2 / (int) SCALE + centerOffset, 
                self.toString()
            );

            set_render_scale(renderer, 1.0f, 1.0f);
        }
    }
}