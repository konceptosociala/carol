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
                map = new Maps.Map(renderer, "assets/tmx/yellow_town_01.tmx");
                map.scale = 2.0f;
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
            map.render();
            
            try {
                player.render(renderer, dt);
            } catch (AssetError e) {
                Debug.error(e.message);
            }
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