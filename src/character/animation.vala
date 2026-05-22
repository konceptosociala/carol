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
        public float speed      { get; set; default = 1.0f; }
        public bool reversed    { get; set; default = false; }
        public bool looped      { get; set; default = false; }
        public bool is_finished {
            get {
                if (looped) {
                    return false;
                } else {
                    if (reversed) {
                        return frame <= 0;
                    } else {
                        return frame >= length - 1;
                    }
                }
            }
        }
        public int length { get; private set; }

        private float accumulator = 0.0f;
        private int frame = 0;
        private Texture tile_sheet;
        private TileCoord[] tiles;

        public Animation(Texture tile_sheet, TileCoord[] tiles) {
            this.tile_sheet = tile_sheet;
            this.tiles = tiles;
            this.length = tiles.length;
        }

        public Animation with_speed(float speed) {
            this.speed = speed;
            return this;
        }

        public Animation with_reversed(bool reversed) {
            this.reversed = reversed;
            return this;
        }

        public Animation with_looped(bool looped) {
            this.looped = looped;
            return this;
        }

        public void reset() {
            accumulator = 0.0f;
            if (reversed) {
                frame = length - 1;
            } else {
                frame = 0;
            }
        }

        public void render_frame(
            Renderer renderer, 
            Vector2 position, 
            int frame,
            float scale
        ) throws AssetError {
            tile_sheet.render(
                renderer, 
                position, 
                scale, 
                tiles[frame]
            );
        }

        public void render(
            Renderer renderer, 
            Vector2 position,
            float scale,
            float dt
        ) throws AssetError {
            accumulator += dt * speed;

            int step = (int) accumulator;
            accumulator -= step;

            if (step != 0) {
                if (reversed) {
                    frame -= step;
                } else {
                    frame += step;
                }

                if (looped) {
                    frame = mod(frame, length);
                } else {
                    if (frame >= length) frame = length - 1;
                    if (frame < 0) frame = 0;
                }
            }

            tile_sheet.render(
                renderer, 
                position, 
                scale, 
                tiles[frame]
            );
        }
    }
}