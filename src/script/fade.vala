namespace Script {
    
    public enum FadeEffect {
        FADE_BLACK,
        FADE_WHITE,
        FLASH_BLACK,
        FLASH_WHITE;

        public static FadeEffect? from_string(string s) {
            switch (s.up()) {
                case "FADE_BLACK":
                    return FADE_BLACK;
                case "FADE_WHITE":
                    return FADE_WHITE;
                case "FLASH_BLACK":
                    return FLASH_BLACK;
                case "FLASH_WHITE": 
                    return FLASH_WHITE;
            }

            return null;
        }
    }
}