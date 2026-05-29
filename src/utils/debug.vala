namespace Carol.Utils.Debug {

    public void trace(string message) {
        #if DEBUG
        stdout.printf("\x1b[34m[DEBUG]\x1b[0m %s\n", message);
        #endif
    }

    public void info(string message) {
        stdout.printf("\x1b[32m[INFO]\x1b[0m %s\n", message);
    }

    public void warn(string message) {
        stdout.printf("\x1b[33m[WARN]\x1b[0m %s\n", message);
    }

    public void error(string message) {
        stdout.printf("\x1b[31m[ERROR]\x1b[0m %s\n", message);
    }
}