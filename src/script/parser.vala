using Gee;
using Utils.Iter;

namespace Script {
    
    public interface ScriptParser {
        public abstract Command parse_command(string s, int line) throws ParsingError;
        public abstract FadeEffect parse_fade_effect(string s, int line) throws ParsingError;
        public abstract Background parse_background(string s, int line) throws ParsingError;
        public abstract string parse_ident(string s, int line) throws ParsingError;
        public abstract int parse_uint(string s, int line) throws ParsingError;
        public abstract int parse_int(string s, int line) throws ParsingError;
        public abstract string parse_string(string s, int line) throws ParsingError;
    }

    public class DefaultScriptParser : ScriptParser {
        private static Regex IDENT_PATTERN = /[a-zA-Z_][a-zA-Z0-9_]*/;
        private static Regex PARTS_PATTERN = / (?=(?:[^\"]*\"[^\"]*\")*[^\"]*$)/;

        public Command parse_command(string s, int line) throws ParsingError {
            var parts = collect<string>(
                new ArrayList<string>.wrap(PARTS_PATTERN.split(s))
                    .filter(v => !v.is_ascii())
            );

            if (parts.length == 0) {
                throw ParsingError.syntax("command", "<empty line>", line);
            }

            CommandKind? kind = CommandKind.from_string(parts[0]);
            if (kind == null) {
                throw ParsingError.unknown_command(s, line);
            }

            switch (kind) {
                case PLAYER_BLOCK:
                    if (parts.length != 1) {
                        throw ParsingError.argument_mismatch(0, parts.length - 1, line);
                    }
                    return new PlayerBlock();

                case PLAYER_UNBLOCK:
                    if (parts.length != 1) {
                        throw ParsingError.argument_mismatch(0, parts.length - 1, line);
                    }
                    return new PlayerUnblock();
            
                case PLAYER_FALL:
                    if (parts.length != 1) {
                        throw ParsingError.argument_mismatch(0, parts.length - 1, line);
                    }
                    return new PlayerFall();
            
                case PLAYER_GETUP:
                    if (parts.length != 1) {
                        throw ParsingError.argument_mismatch(0, parts.length - 1, line);
                    }
                    return new PlayerGetup();
            
                case PLAYER_HURT:
                    if (parts.length != 2) {
                        throw ParsingError.argument_mismatch(1, parts.length - 1, line);
                    }
                    return new PlayerHurt(parse_uint(parts[1], line));
            
                case PLAYER_MOVE:
                    if (parts.length != 3) {
                        throw ParsingError.argument_mismatch(2, parts.length - 1, line);
                    }
                    return new PlayerMove(parse_int(parts[1], line), parse_int(parts[2], line));
            
                case NPC_MOVE:
                    if (parts.length != 3) {
                        throw ParsingError.argument_mismatch(2, parts.length - 1, line);
                    }
                    return new NpcMove(parse_int(parts[1], line), parse_int(parts[2], line));
            
                case SHOW_DIALOG:
                    if (parts.length < 2) {
                        throw ParsingError.argument_mismatch(1, parts.length - 1, line);
                    }

                    var messages = new ArrayList<string>();

                    for (int i = 1; i < parts.length; i++) {
                        messages.add(parse_string(parts[i], line));
                    }

                    return new ShowDialog(messages);
            
                case SHOW_DIALOG_CHR:
                    if (parts.length != 3) {
                        throw ParsingError.argument_mismatch(2, parts.length - 1, line);
                    }
                    return new ShowDialogChr(parse_ident(parts[1], line), parse_string(parts[2], line));
            
                case WAIT:
                    if (parts.length != 2) {
                        throw ParsingError.argument_mismatch(1, parts.length - 1, line);
                    }
                    return new Wait(parse_uint(parts[1], line));
            
                case GIVE_ITEM:
                    if (parts.length != 2) {
                        throw ParsingError.argument_mismatch(1, parts.length - 1, line);
                    }
                    return new GiveItem(parse_ident(parts[1], line));
            
                case GOTO_LEVEL:
                    if (parts.length != 2) {
                        throw ParsingError.argument_mismatch(1, parts.length - 1, line);
                    }
                    return new GotoLevel(parse_ident(parts[1], line));
            
                case GOTO_LEVEL_WITH:
                    if (parts.length != 3) {
                        throw ParsingError.argument_mismatch(2, parts.length - 1, line);
                    }
                    return new GotoLevelWith(parse_fade_effect(parts[1], line), parse_ident(parts[2], line));
            
                case JUST_EFFECT:
                    if (parts.length != 2) {
                        throw ParsingError.argument_mismatch(1, parts.length - 1, line);
                    }
                    return new JustEffect(parse_fade_effect(parts[1], line));
            
                case SET_BG:
                    if (parts.length != 2) {
                        throw ParsingError.argument_mismatch(1, parts.length - 1, line);
                    }
                    return new SetBg(parse_background(parts[1], line));

                default:
                    assert_not_reached();
            }
        }

        public FadeEffect parse_fade_effect(string s, int line) throws ParsingError {
            FadeEffect? value = FadeEffect.from_string(s);
            if (value == null) {
                throw ParsingError.syntax("fade effect", s, line);
            }

            return (!) value;
        }

        public Background parse_background(string s, int line) throws ParsingError {
            Background? value = Background.from_string(s);
            if (value == null) {
                throw ParsingError.syntax("background", s, line);
            }

            return (!) value;
        }

        public string parse_ident(string s, int line) throws ParsingError {
            if (IDENT_PATTERN.match(s)) {
                return s;
            } else {
                throw ParsingError.syntax("ident", s, line);
            }
        }

        public int parse_uint(string s, int line) throws ParsingError {
            int value;
            bool success = int.try_parse(s, out value);

            if (!success || value < 0) {
                throw ParsingError.syntax("unsigned int", s, line);
            }
            return value;
        }

        public int parse_int(string s, int line) throws ParsingError {
            int value;
            bool success = int.try_parse(s, out value);

            if (!success) {
                throw ParsingError.syntax("int", s, line);
            }
            return value;
        }

        public string parse_string(string s, int line) throws ParsingError {
            if (!s.has_prefix("\"") || !s.has_suffix("\"")) {
                throw ParsingError.syntax("string", s, line);
            } else {
                return s.substring(1, s.length - 1);
            }
        }
    }
}