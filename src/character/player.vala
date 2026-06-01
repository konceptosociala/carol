using Gee;
using Carol.Utils.Render;
using Carol.Utils.Math;
using Carol.Utils.Assets;
using Carol.Character.Animations;
using SDL.Events;
using SDL.Keyboard;

namespace Carol.Character.Player {
    public delegate bool CheckSolid(Vector2 position);

    public enum LayStatus {
        FALLING,
        FALLEN,
        GETTING_UP,
        STANDING,
    }

    public class Player : Object {
        public const float HITBOX_OFFSET_X = 50f;
        public const float HITBOX_OFFSET_Y = 100f;
        public const float HITBOX_WIDTH = 28f;
        public const float HITBOX_HEIGHT = 30f;
        public const float SPEED = 100f;

        public int health { get; set; default = 100; }
        public bool is_dead { get { return health <= 0; } }
        public Vector2 position { get; private set; default = Vector2(100, 100); }
        private Vector2 velocity {
            get;
            private set;
            default = Vector2.ZERO;
        }
        private LayStatus lay_status {
            get;
            private set;
            default = STANDING;
        }

        // Inner state
        private bool left;
        private bool right;
        private bool up;
        private bool down;
        private Texture sheet;
        private Vector2 previous_pixel_position = Vector2.ZERO;

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
                    .with_speed(6.0f)
                    .with_looped(true)
            );
            animations.set(
                AnimationId.WALK_LEFT, 
                new Animation(sheet, AnimationId.WALK_LEFT.get_tiles())
                    .with_speed(6.0f)
                    .with_looped(true)
            );
            animations.set(
                AnimationId.WALK_DOWN, 
                new Animation(sheet, AnimationId.WALK_DOWN.get_tiles())
                    .with_speed(6.0f)
                    .with_looped(true)
            );
            animations.set(
                AnimationId.WALK_RIGHT, 
                new Animation(sheet, AnimationId.WALK_RIGHT.get_tiles())
                    .with_speed(6.0f)
                    .with_looped(true)
            );
            animations.set(
                AnimationId.FALL, 
                new Animation(sheet, AnimationId.FALL.get_tiles())
                    .with_speed(6.0f)
                    .with_looped(false)
                    .with_reversed(false)
            );
            animations.set(
                AnimationId.GETUP, 
                new Animation(sheet, AnimationId.GETUP.get_tiles())
                    .with_speed(6.0f)
                    .with_looped(false)
                    .with_reversed(true)
            );
        }

        public void update(float delta, CheckSolid is_solid) {
            velocity = Vector2.ZERO;

            if (is_dead && lay_status != FALLEN) {
                lay_status = FALLING;
            }

            if (lay_status != STANDING) 
                return;

            BoundingBox hit_box = BoundingBox(
                position.add_sep(HITBOX_OFFSET_X, HITBOX_OFFSET_Y), 
                HITBOX_WIDTH, 
                HITBOX_HEIGHT
            );

            Vector2 new_velocity = Vector2.ZERO;
            with (new_velocity) {
                if (left) x = -1;
                if (right) x = 1;
                if (up) y = -1;
                if (down) y = 1;
            }
            velocity = new_velocity;

            if (velocity.x > 0) current_animation = WALK_RIGHT;
            else if (velocity.x < 0) current_animation = WALK_LEFT;
            else if (velocity.y > 0) current_animation = WALK_DOWN;
            else if (velocity.y < 0) current_animation = WALK_UP;

            if (!velocity.is_zero()) {
                velocity = velocity.normalize().scalar(SPEED * delta);

                Vector2 dir = velocity.scalar(2);
                bool solid = false;
                
                if (velocity.x > 0) {
                    solid = solid 
                        || is_solid(hit_box.right_bottom.add_sep(dir.x, 0)) 
                        || is_solid(hit_box.right_top.add_sep(dir.x, 0));
                }
                if (velocity.x < 0) {
                    solid = solid 
                        || is_solid(hit_box.left_bottom.add_sep(dir.x, 0)) 
                        || is_solid(hit_box.left_top.add_sep(dir.x, 0));
                }
                if (velocity.y > 0) {
                    solid = solid 
                        || is_solid(hit_box.left_top.add_sep(0, dir.y))
                        || is_solid(hit_box.right_top.add_sep(0, dir.y));
                }
                if (velocity.y < 0) {
                    solid = solid 
                        || is_solid(hit_box.left_bottom.add_sep(0, dir.y))
                        || is_solid(hit_box.right_bottom.add_sep(0, dir.y));
                }

                Vector2 new_position = position.add(velocity);
                if (solid) {
                    velocity = Vector2.ZERO;
                } else {
                    position = new_position;
                }
            }
        }

        public void render(Renderer renderer, float dt) throws AssetError {
            bool is_moving = !velocity.is_zero();

            if (is_moving) {
                position = position.add(velocity);
            }

            float aligned_x = Math.roundf(position.x);
            float aligned_y = Math.roundf(position.y);

            if (is_moving) {
                if (aligned_x != previous_pixel_position.x || aligned_y != previous_pixel_position.y) {
                    with (previous_pixel_position) {
                        x = aligned_x; 
                        y = aligned_y;
                    }
                }
            } else if (lay_status == STANDING || lay_status == FALLEN) {
                with (previous_pixel_position) {
                    x = aligned_x;
                    y = aligned_y;
                }
            }

            switch (lay_status) {
                case FALLING:
                    Animation fall_animation = animations.get(FALL);
                    fall_animation.render(renderer, position, 2.0f, dt);

                    if (fall_animation.is_finished) {
                        lay_status = FALLEN;
                    }
                    break;
                    
                case GETTING_UP:
                    Animation getup_animation = animations.get(GETUP);
                    getup_animation.render(renderer, position, 2.0f, dt);

                    if (getup_animation.is_finished) {
                        lay_status = STANDING;
                        current_animation = WALK_DOWN;
                    }
                    break;

                case FALLEN:
                    Animation fall_animation = animations.get(FALL);
                    fall_animation.render_frame(
                        renderer, 
                        position, 
                        fall_animation.length - 1, 
                        2.0f
                    );
                    break;

                case STANDING:
                    Animation animation = animations.get(current_animation);
                    Vector2 render_position;

                    if (is_moving) {
                        render_position = position;
                        animation.render(
                            renderer,
                            render_position,
                            2.0f,
                            dt
                        );
                    } else {
                        render_position = Vector2(aligned_x, aligned_y);
                        animation.render_frame(
                            renderer, 
                            render_position, 
                            0, 
                            2.0f
                        );
                    }
                    break;
            }
        }

        public void render_collision(Renderer renderer) {
            BoundingBox hit_box = BoundingBox(
                position.add_sep(HITBOX_OFFSET_X, HITBOX_OFFSET_Y), 
                HITBOX_WIDTH, 
                HITBOX_HEIGHT
            );

            SDL.Render.set_render_draw_color(renderer.sdl, 255, 0, 0, 255);
            SDL.Render.render_rect(
                renderer.sdl,
                SDL.Rect.FRect() {
                    x = hit_box.left_bottom.x,
                    y = hit_box.left_bottom.y,
                    w = HITBOX_WIDTH,
                    h = HITBOX_HEIGHT
                }
            );
        }

        public void on_event(Event e) {
            if (e.type == EventType.KEY_DOWN) {
                switch (e.key.scancode) {
                    case Scancode.LEFT:
                        left = true;
                        break;

                    case Scancode.RIGHT:
                        right = true;
                        break;

                    case Scancode.UP:
                        up = true;
                        break;

                    case Scancode.DOWN:
                        down = true;
                        break;

                    default: break;
                }
            }

            if (e.type == EventType.KEY_UP) {
                switch (e.key.scancode) {
                    case Scancode.LEFT:
                        left = false;
                        break;

                    case Scancode.RIGHT:
                        right = false;
                        break;

                    case Scancode.UP:
                        up = false;
                        break;

                    case Scancode.DOWN:
                        down = false;
                        break;

                    default: break;
                }
            }
        }
    }
}
