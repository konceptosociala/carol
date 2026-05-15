namespace Utils {
    
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
}