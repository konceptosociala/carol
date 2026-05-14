using SDL;
using SDL.Timer;
using SDL.Init;
using SDL.Video;
using SDL.Render;
using SDL.Events;

using Engine;

public class MyGame : Game {
    private UIManager ui;

    protected override void init() {
        create_window_and_renderer(
            "My game",
            640,
            480,
            WindowFlags.FULLSCREEN,
            out window,
            out renderer
        );

        ui = new UIManager(renderer);
        set_screen(new MainMenuScreen(ui, window, this));
    }

    public static int main(string[] args) {
        Init.init(InitFlags.VIDEO);

        MyGame game = new MyGame();
        game.run();
        
        return 0;
    }
}