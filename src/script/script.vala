using Gee;

namespace Script {

    public class Script {
        private ArrayList<Command> commands;

        public Script(string path, ScriptParser parser) throws ParsingError {
            var commands = new ArrayList<Command>();
            string script;

            try {
                GLib.FileUtils.get_contents(path, out script);
            } catch (GLib.FileError e) {
                throw ParsingError.file_error(path);
            }

            string[] lines = script.split("\n");
            if (lines.length == 0) {
                throw ParsingError.syntax("script", "<empty script>", 1);
            }
            
            for (int i = 0; i < lines.length; i++) {
                string line = lines[i].strip();
                if (line.length == 0 || line.has_prefix("#")) {
                    continue;
                }

                Command command = parser.parse_command(line, i + 1);
                commands.add(command);
            }

            this.commands = commands;
        }

        public Script.with_commands(ArrayList<Command> commands) {
            this.commands = commands;
        }
    }

    public class ScriptRunner {
        public void execute(Script script) {
            // TODO: Script runner
        }
    }
}