using SDL;
using SDL.Timer;
using SDL.Init;
using SDL.Video;
using SDL.Render;
using SDL.Events;

using Engine;

public class CarolGame : Game {
    private UIManager ui;

    public CarolGame() {
        base("Game", 640, 480, WindowFlags.FULLSCREEN);
    }

    protected override void init() {
        ui = new UIManager(renderer);
        set_screen(new MainMenuScreen(ui, window, this));
    }

    public static int main(string[] args) {
        Init.init(InitFlags.VIDEO);

        CarolGame game = new CarolGame();
        game.run();
        
        return 0;
    }
}