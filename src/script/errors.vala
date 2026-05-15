namespace Script {
    
    public errordomain ParsingError {
        INVALID_SYNTAX,
        UNKNOWN_COMMAND,
        ARGUMENT_MISMATCH,
        FILE_READ_ERROR;

        public static ParsingError syntax(string expected, string found, int line) {
            return new ParsingError.INVALID_SYNTAX(
                "Parsing error at line %d: expected %s, found \"%s\"".printf(
                    line, expected, found
                )
            );
        }

        public static ParsingError unknown_command(string command, int line) {
            return new ParsingError.UNKNOWN_COMMAND(
                "Parsing error at line %d: unknown command `%s`".printf(
                    line, command
                )
            );
        }

        public static ParsingError argument_mismatch(int expected, int found, int line) {
            return new ParsingError.ARGUMENT_MISMATCH(
                "Parsing error at line %d: expected %d arguments, found %d".printf(
                    line, expected, found
                )
            );
        }

        public static ParsingError file_error(string path) {
            return new ParsingError.FILE_READ_ERROR(
                "Parsing error: failed to read script file `%s`".printf(path)
            );
        }
    }
}