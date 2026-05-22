using Carol.Utils.Assets;
using Carol.Utils.Render;
using Carol.Utils.Math;

namespace Carol.Character.Animations {

    public enum AnimationId {
        WALK_UP,
        WALK_LEFT,
        WALK_DOWN,
        WALK_RIGHT,
        FALL,
        GETUP;

        public TileCoord[] get_tiles() {
            switch (this) {
                case WALK_UP:
                    return TileCoord.getRow(8, 9);
                case WALK_LEFT:
                    return TileCoord.getRow(9, 9);
                case WALK_DOWN:
                    return TileCoord.getRow(10, 9);
                case WALK_RIGHT:
                    return TileCoord.getRow(11, 9);
                case FALL:
                    return TileCoord.getRow(20, 6);
                case GETUP:
                    return TileCoord.getRow(20, 6);
            }

            assert_not_reached();
        }
    }

    public class Animation {
        public float speed   { get; set; default = 1.0f; }
        public bool reversed { get; set; default = false; }
        public bool looped   { get; set; default = false; }

        private float current_tile = 0.0f;
        private Texture tile_sheet;
        private TileCoord[] tiles;
        private int length;

        public Animation(Texture tile_sheet, TileCoord[] tiles) {
            this.tile_sheet = tile_sheet;
            this.tiles = tiles;
            this.length = tiles.length;
        }

        public void render(
            Renderer renderer, 
            Vector2 position,
            float scale,
            float dt
        ) throws AssetError {
            current_tile = (current_tile + dt * speed) % length;

            tile_sheet.render(
                renderer, 
                position, 
                scale, 
                tiles[(int) current_tile]
            );
        }
    }
}