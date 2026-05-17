using SDL.Events;

namespace Carol.Screens {

    public abstract class Screen {
        public virtual void init() {}
        public virtual void update(float dt) {}
        public virtual void render(float dt) {}
        public virtual void on_event(Event e) {}
        public virtual void shutdown() {}
    }
}