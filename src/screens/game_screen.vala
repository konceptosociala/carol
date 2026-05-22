using Carol.Utils.Assets;
using Carol.Utils.Render;
using Carol.Utils.Math;
using Carol.Utils;
using Carol.Character.Player;
using SDL.Events;

namespace Carol.Screens {

    public class GameScreen : Screen {
        private Renderer renderer;
        private Player player;

        public GameScreen(Renderer renderer) {
            this.renderer = renderer;
        }

        public override void init() {
            try {
                player = new Player(renderer);
            } catch (AssetError e) {
                Debug.error(e.message);
            }
        }

        public override void update(float dt) {
            player.update(dt, (pos) => false);
        }

        public override void on_event(Event e) {
            player.on_event(e);
        }

        public override void render(float dt) {
            try {
                player.render(renderer, dt);
            } catch (AssetError e) {
                Debug.error(e.message);
            }
        }
    }
}