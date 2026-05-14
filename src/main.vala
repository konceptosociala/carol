using SDL.Timer;
using SDL.Init;
using SDL.Video;
using SDL.Render;
using SDL.Log;
using SDL.Error;
using SDL.Events;
using SDL.Pixels;

public class App {
    public static int main(string[] args) {
        Window window = null;
        Renderer renderer = null;

        set_app_metadata("Vala SDL App", "0.1", "org.konceptosociala.vala_sdl_app");

        if (!init(InitFlags.VIDEO)) {
            log_error(LogCategory.ERROR, "Couldn't initialize SDL: %s", get_error());
            return 1;
        }

        if (!create_window_and_renderer(
            "example", 640, 480, 
            WindowFlags.RESIZABLE, 
            out window, out renderer
        )) {
            log_error(LogCategory.ERROR, "Couldn't create window/renderer: %s", get_error());
            return 1;
        }

        set_render_logical_presentation(renderer, 640, 480, RendererLogicalPresentation.LETTERBOX);

        Event event;
        bool running = true;

        while (running) {
            while (poll_event(out event)) {
                if (event.type == EventType.QUIT) {
                    running = false;
                }
            }

            double now = get_ticks() / 1000.0;

            float red   = 0.5f + 0.5f * (float) Math.sin(now);
            float green = 0.5f + 0.5f * (float) Math.sin(now + Math.PI * 2 / 3);
            float blue  = 0.5f + 0.5f * (float) Math.sin(now + Math.PI * 4 / 3);

            set_render_draw_color_float(renderer, red, green, blue, ALPHA_OPAQUE_FLOAT);
            render_clear(renderer);
            render_present(renderer);
        }

        return 0;
    }
}