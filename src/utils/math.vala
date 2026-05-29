namespace Carol.Utils.Math {
    
    public struct Vector2 {
        public float x;
        public float y;

        public const Vector2 ZERO = { 0.0f, 0.0f };

        public Vector2(float x, float y) {
            this.x = x;
            this.y = y;
        }

        public Vector2 normalize() {
            if (is_zero()) {
                return Vector2.ZERO;
            }

            float length = GLib.Math.sqrtf(x * x + y * y);
            return Vector2(x / length, y / length);
        }

        public Vector2 scalar(float scalar) {
            return Vector2(x * scalar, y * scalar);
        }

        public Vector2 add(Vector2 other) {
            return Vector2(x + other.x, y + other.y);
        }

        public Vector2 add_sep(float x, float y) {
            return Vector2(this.x + x, this.y + y);
        }

        public bool is_zero() {
            return x == 0.0f && y == 0.0f;
        }
    }

    public struct BoundingBox {
        public Vector2 left_bottom;
        public Vector2 right_bottom;
        public Vector2 left_top;
        public Vector2 right_top;

        public BoundingBox(Vector2 origin, float width, float height) {
            left_bottom = Vector2(origin.x, origin.y);
            right_bottom = Vector2(origin.x + width, origin.y);
            left_top = Vector2(origin.x, origin.y + height);
            right_top = Vector2(origin.x + width, origin.y + height);
        }
    }

    public int mod(int a, int n) {
        return (a % n + n) % n;
    }

    public struct Color {
        uint8 r;
        uint8 g;
        uint8 b;
        uint8 a;

        public SDL.Pixels.Color to_sdl_color() {
            return SDL.Pixels.Color() { r = r, g = g, b = b, a = a };
        }
    }
}