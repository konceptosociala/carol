using Carol.Utils.Assets;

namespace Carol.Character.Animation {
    public enum AnimationId {
        WALK_UP,
        WALK_LEFT,
        WALK_DOWN,
        WALK_RIGHT,
        FALL,
        GETUP;

        public TileCoord[] get_tiles() {
            return {
                TileCoord(0, 10),
                TileCoord(1, 10),
                TileCoord(2, 10),
                TileCoord(3, 10),
                TileCoord(4, 10),
                TileCoord(5, 10),
                TileCoord(6, 10),
                TileCoord(7, 10),
                TileCoord(8, 10),
            };
        }
    }
}