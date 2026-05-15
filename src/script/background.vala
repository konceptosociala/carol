namespace Script {
    
    public enum Background {
        BLACK,
        WHITE,
        NONE;

        public static Background? from_string(string s) {
            switch (s.up()) {
                case "BLACK":
                    return BLACK;
                case "WHITE":
                    return WHITE;
                case "NONE":
                    return NONE;
            }

            return null;
        }
    }
}