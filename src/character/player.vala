using Gee;
using Carol.Utils.Render;
using Carol.Utils.Math;
using Carol.Utils.Assets;
using Carol.Character.Animations;

namespace Carol.Character.Player {

    public class Player : Object {
        public const float HITBOX_OFFSET_X = 18f;
        public const float HITBOX_OFFSET_Y = 0f;
        public const float HITBOX_WIDTH = 28f;
        public const float HITBOX_HEIGHT = 20f;
        public const float SPEED = 50f;

        public enum LayStatus {
            FALLING,
            FALLEN,
            GETTING_UP,
            STANDING,
        }

        public int health { get; set; default = 100; }
        public Vector2 position { get; private set; default = Vector2(100, 100); }
        public Vector2 velocity {
            get; 
            private set;
            default = Vector2.ZERO;
        }
        private LayStatus lay_status {
            get; 
            private set;
            default = LayStatus.STANDING;
        }

        // Inner state
        private Texture sheet;
        private Vector2 previous_pixel_position = Vector2.ZERO;
        private float animation_time = 0f;

        // Animations
        private Map<AnimationId, Animation> animations;
        private AnimationId current_animation = WALK_DOWN;

        public Player(Renderer renderer) throws AssetError {
            sheet = new Texture.with_tiles(
                renderer, 
                "anim/carol.png", 
                64, 
                64,
                TextureFilter.NEAREST
            );

            animations = new HashMap<AnimationId, Animation>();
            animations.set(
                AnimationId.WALK_UP, 
                new Animation(sheet, AnimationId.WALK_UP.get_tiles())
            );
            animations.set(
                AnimationId.WALK_LEFT, 
                new Animation(sheet, AnimationId.WALK_LEFT.get_tiles())
            );
            animations.set(
                AnimationId.WALK_DOWN, 
                new Animation(sheet, AnimationId.WALK_DOWN.get_tiles())
            );
            animations.set(
                AnimationId.WALK_RIGHT, 
                new Animation(sheet, AnimationId.WALK_RIGHT.get_tiles())
            );
            animations.set(
                AnimationId.FALL, 
                new Animation(sheet, AnimationId.FALL.get_tiles())
            );

            var getup = new Animation(sheet, AnimationId.GETUP.get_tiles());
            getup.reversed = true;
            animations.set(AnimationId.GETUP, getup);
        }
    }
}