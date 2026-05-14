using SDL.Init;
using SDL.Video;
using SDL.Render;
using SDL.Log;
using SDL.Error;
using SDL.Events;

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
            
        }

        return 0;
    }
}