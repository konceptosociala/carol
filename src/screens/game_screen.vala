using Carol.Utils.Assets;
using Carol.Utils.Render;
using Carol.Utils.Math;
using Carol.Utils;
using Carol.Character.Animation;

namespace Carol.Screens {

    public class GameScreen : Screen {
        private Renderer renderer;
        private Texture texture;
        private float current_tile = 0.0f;

        public GameScreen(Renderer renderer) {
            this.renderer = renderer;
        }

        public override void init() {
            try {
                texture = new Texture.with_tiles(
                    renderer, 
                    "anim/carol.png", 
                    64, 
                    64,
                    TextureFilter.NEAREST
                );
            } catch (AssetError e) {
                Debug.error(e.message);
            }
        }

        public override void render(float dt) {
            current_tile = (current_tile + dt * 4) % 9;

            var anim = AnimationId.WALK_DOWN;
            var tiles = anim.get_tiles();

            print(current_tile.to_string()+"\n");

            try {
                texture.render(renderer, Vector2(0.0f, 0.0f), 2.0f, tiles[(int) current_tile]);
            } catch (AssetError e) {
                Debug.error(e.message);
            }
        }
    }
}