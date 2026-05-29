using Carol.Utils.Assets;
using Carol.Utils.Render;
using Carol.Utils.Math;
using Carol.Utils;
using Carol.Utils.Maps;
using Carol.Character.Player;
using SDL.Events;

namespace Carol.Screens {

    public class GameScreen : Screen {
        private Renderer renderer;
        private Player player;
        private Map map;
        private Vector2 cameraPos;

        public GameScreen(Renderer renderer) {
            this.renderer = renderer;
        }

        public override void init() {
            try {
                player = new Player(renderer);
                map = new Map(renderer, "assets/tmx/test0100.tmx");
                map.scale = 2.0f;
            } catch (AssetError e) {
                Debug.error(e.message);
            }
        }

        public override void update(float dt) {
            player.update(dt, (pos) => map.is_solid(pos, "Collision"));
            update_camera_pos();
        }

        public override void on_event(Event e) {
            player.on_event(e);
        }

        public override void render(float dt) {
            map.render_layer("Background");
            map.render_layer("Collision");

            try {
                player.render(renderer, dt);
            } catch (AssetError e) {
                Debug.error(e.message);
            }

            map.render_layer("Upper");

            // Debug
            map.render_collision("Collision");
            player.render_collision(renderer);
        }

        private void update_camera_pos() {
            var current_map = (!) map;
            
            Vector2 position = player.position;
            float viewport_width = 800;
            float viewport_height = 600;
        
            float map_width = current_map.width * current_map.tile_width;
            float map_height = current_map.height * current_map.tile_height;

            cameraPos.x = float.max(
                viewport_width / 2,
                float.min(position.x + 32, map_width - viewport_width / 2)
            );

            cameraPos.y = float.max(
                viewport_height / 2,
                float.min(position.y + 32, map_height - viewport_height / 2)
            );
        }
    }
}