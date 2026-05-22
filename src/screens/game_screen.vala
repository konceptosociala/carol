using Carol.Utils.Assets;
using Carol.Utils.Render;
using Carol.Utils.Math;
using Carol.Utils;
using Carol.Character.Player;

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

        public override void render(float dt) {
            try {
                //  animation.render(renderer, Vector2(0.0f, 0.0f), 2.0f, dt);
            } catch (AssetError e) {
                Debug.error(e.message);
            }
        }
    }
}