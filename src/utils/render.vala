namespace Carol.Utils.Render {

    public class Renderer {
        public SDL.Render.Renderer sdl;

        public Renderer(SDL.Render.Renderer sdl) {
            this.sdl = sdl;
        }
    }
}