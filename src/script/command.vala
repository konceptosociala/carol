using Gee;

namespace Script {

    public enum CommandKind {
        PLAYER_BLOCK,
        PLAYER_UNBLOCK,
        PLAYER_FALL,
        PLAYER_GETUP,
        PLAYER_HURT,
        PLAYER_MOVE,
        NPC_MOVE,
        SHOW_DIALOG,
        SHOW_DIALOG_CHR,
        WAIT,
        GIVE_ITEM,
        GOTO_LEVEL,
        GOTO_LEVEL_WITH,
        JUST_EFFECT,
        SET_BG;

        public static CommandKind? from_string(string s) {
            switch (s.up()) {
                case "PLAYER_BLOCK":
                    return PLAYER_BLOCK;
                case "PLAYER_UNBLOCK":
                    return PLAYER_UNBLOCK;
                case "PLAYER_FALL":
                    return PLAYER_FALL;
                case "PLAYER_GETUP":
                    return PLAYER_GETUP;
                case "PLAYER_HURT":
                    return PLAYER_HURT;
                case "PLAYER_MOVE":
                    return PLAYER_MOVE;
                case "NPC_MOVE":
                    return NPC_MOVE;
                case "SHOW_DIALOG":
                    return SHOW_DIALOG;
                case "SHOW_DIALOG_CHR":
                    return SHOW_DIALOG_CHR;
                case "WAIT":
                    return WAIT;
                case "GIVE_ITEM":
                    return GIVE_ITEM;
                case "GOTO_LEVEL":
                    return GOTO_LEVEL;
                case "GOTO_LEVEL_WITH":
                    return GOTO_LEVEL_WITH;
                case "JUST_EFFECT":
                    return JUST_EFFECT;
                case "SET_BG":
                    return SET_BG;
            }

            return null;
        }
    }
    
    public interface Command : Object {}

    public class PlayerBlock : Object, Command {}

    public class PlayerUnblock : Object, Command {}

    public class PlayerFall : Object, Command {}

    public class PlayerGetup : Object, Command {}
    
    public class PlayerHurt : Object, Command {
        public int health;

        public PlayerHurt(int health) {
            this.health = health;
        }
    }

    public class PlayerMove : Object, Command {
        public int x;
        public int y;

        public PlayerMove(int x, int y) {
            this.x = x;
            this.y = y;
        }
    }

    public class NpcMove: Object, Command {
        public int x;
        public int y;

        public NpcMove(int x, int y) {
            this.x = x;
            this.y = y;
        }
    }

    public class ShowDialog : Object, Command {
        public ArrayList<string> messages;

        public ShowDialog(ArrayList<string> messages) {
            this.messages = messages;
        }
    }

    public class ShowDialogChr : Object, Command {
        public string characterId;
        public string message;

        public ShowDialogChr(string characterId, string message) {
            this.characterId = characterId;
            this.message = message;
        }
    }

    public class Wait : Object, Command {
        public int millis;

        public Wait(int millis) {
            this.millis = millis;
        }
    }

    public class GiveItem : Object, Command {
        public string itemId;

        public GiveItem(string itemId) {
            this.itemId = itemId;
        }
    }

    public class GotoLevel : Object, Command {
        public string levelId;

        public GotoLevel(string levelId) {
            this.levelId = levelId;
        }
    }

    public class GotoLevelWith : Object, Command {
        public FadeEffect fade;
        public string levelId;

        public GotoLevelWith(FadeEffect fade, string levelId) {
            this.fade = fade;
            this.levelId = levelId;
        }
    }

    public class JustEffect : Object, Command {
        public FadeEffect effect;

        public JustEffect(FadeEffect effect) {
            this.effect = effect;
        }
    }
    
    public class SetBg : Object, Command {
        public Background color;

        public SetBg(Background color) {
            this.color = color;
        }
    }
}