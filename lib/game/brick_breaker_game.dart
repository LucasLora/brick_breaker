import 'package:brick_breaker/game/world.dart';
import 'package:brick_breaker/ui/screens/game/game_viewmodel.dart';
import 'package:brick_breaker/ui/screens/settings/settings_viewmodel.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class BrickBreakerGame extends Forge2DGame<BrickBreakerWorld> {
  final SettingsViewModel settingsViewModel;
  final GameViewModel gameViewModel;

  BrickBreakerGame(this.settingsViewModel, this.gameViewModel)
    : super(
        world: BrickBreakerWorld(settingsViewModel, gameViewModel),
        camera: CameraComponent.withFixedResolution(
          width: 180 * lengthFactor,
          height: 320 * lengthFactor,
        ),
      );

  static const lengthFactor = 0.1;

  void startGame() {
    world.startGame();
  }

  @override
  void onLoad() {
    camera.viewfinder.zoom = 1.0;
    camera.moveTo(camera.viewport.virtualSize * 0.5);
  }
}
