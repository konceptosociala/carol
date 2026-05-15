using SDL.Video;
using SDL.Events;
using SDL.Keyboard;

using Engine;

public class MainMenuScreen : Screen {
    private Window window;
    private UIManager ui;
    private Game game;
    private MainMenuButton current_button = MainMenuButton.PLAY;

    public MainMenuScreen(UIManager ui, Window window, Game game) {
        this.ui = ui;
        this.window = window;
        this.game = game;
    }

    public override void on_event(Event e) {
        if (e.type == EventType.KEY_DOWN) {
            switch (e.key.scancode) {
                case Scancode.UP:
                    if (current_button == MainMenuButton.PLAY) {
                        current_button = MainMenuButton.EXIT;
                    } else {
                        current_button = (MainMenuButton) ((int) current_button - 1);
                    } 
                    break;
                case Scancode.DOWN:
                    if (current_button == MainMenuButton.EXIT) {
                        current_button = MainMenuButton.PLAY;
                    } else {
                        current_button = (MainMenuButton) ((int) current_button + 1);
                    }
                    break;
                case Scancode.RETURN: 
                    process_button();
                    break;

                default: break;
            }
        }
    }

    private void process_button() {
        switch (current_button) {
            case MainMenuButton.PLAY:
                game.set_screen(new GameScreen());
                break;

            case MainMenuButton.OPTIONS:
                // TODO: options
                break;

            case MainMenuButton.EXIT:
                game.quit();
                break;
        }
    }

    public override void render() {
        int w, h;
        get_window_size(window, out w, out h);

        ui.menu_button(w, h, -50, MainMenuButton.PLAY, current_button);
        ui.menu_button(w, h, 0, MainMenuButton.OPTIONS, current_button);
        ui.menu_button(w, h, 50, MainMenuButton.EXIT, current_button);
    }
}

public enum MainMenuButton {
    PLAY,
    OPTIONS,
    EXIT;

    public string toString() {
        switch (this) {
            case PLAY:
                return "Play";
            case OPTIONS:
                return "Options";
            case EXIT:
                return "Exit";
            default:
                assert_not_reached();
        }
    }
}