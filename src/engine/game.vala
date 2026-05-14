using SDL.Timer;
using SDL.Video;
using SDL.Render;
using SDL.Events;

public abstract class Game  {
    protected Window window;
    protected Renderer renderer;
    private bool running = true;
    private Screen current_screen;

    public void run() {
        init();
        loop();
        shutdown();
    }

    protected virtual void init() {}
    protected virtual void update(float dt) {}
    protected virtual void render() {}
    protected virtual void shutdown() {}

    public void set_screen(Screen screen) {
        this.current_screen = screen;
        this.current_screen.init();
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
                current_screen.on_event(e);
            }

            uint64 now = get_ticks();
            float dt = (now - last) / 1000.0f;
            last = now;

            update(dt);
            current_screen.update(dt);

            set_render_draw_color(renderer, 0, 0, 0, 255);
            render_clear(renderer);

            render();
            current_screen.render();

            render_present(renderer);
        }
    }

    protected virtual void on_event(Event e) {}
}