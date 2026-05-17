using SDL;
using SDL.Timer;
using SDL.Video;
using SDL.Events;

using Carol.Screens;
using Carol.Utils.Render;

namespace Carol.Utils {

    public class Game : Object {
        public Window window { get; construct; }
        public Renderer renderer { get; construct; }
        public ScreenManager screen_manager { get; private set; }
        private bool running = true;

        public Game(
            string title,
            int width,
            int height,
            WindowFlags window_flags
        ) {
            Window? w;
            SDL.Render.Renderer? r;

            SDL.Render.create_window_and_renderer(
                title, 
                width, 
                height,
                window_flags,
                out w,
                out r
            );

            assert(w != null);
            assert(r != null);

            Object (
                window: (!) w, 
                renderer: new Renderer((!) r)
            );
            
            screen_manager = new ScreenManager(this);
        }

        public void run() {
            init();
            loop();
            shutdown();
        }

        protected virtual void init() {}
        protected virtual void update(float dt) {}
        protected virtual void render(float dt) {}
        protected virtual void shutdown() {}

        public void set_screen(Screen screen) {
            screen_manager.current_screen = screen;
        }

        public void quit() {
            running = false;
        }

        private void loop() {
            Event e;
            uint64 last = get_ticks();

            while (running) {
                while (poll_event(out e)) {
                    if (e.type == EventType.QUIT)
                        running = false;

                    on_event(e);
                    screen_manager.current_screen.on_event(e);
                }

                uint64 now = get_ticks();
                float dt = (now - last) / 1000.0f;
                last = now;

                update(dt);
                screen_manager.current_screen.update(dt);

                SDL.Render.set_render_draw_color(renderer.sdl, 0, 0, 0, 255);
                SDL.Render.render_clear(renderer.sdl);

                render(dt);
                screen_manager.current_screen.render(dt);

                SDL.Render.render_present(renderer.sdl);
            }
        }

        protected virtual void on_event(Event e) {}
    }

    public class ScreenManager {
        private Game game;
        private Screen _current_screen;

        public Screen current_screen {
            get { return _current_screen; }
            set {
                _current_screen = value;
                _current_screen.init();
            }
        }

        public ScreenManager(Game game) {
            this.game = game;
        }
    }
}