import 'dart:async';

import 'package:brick_breaker/models/enums/difficulty.dart';
import 'package:brick_breaker/ui/game/actors/ball.dart';
import 'package:brick_breaker/ui/game/actors/brick_zone.dart';
import 'package:brick_breaker/ui/game/actors/paddle.dart';
import 'package:brick_breaker/ui/game/actors/walls.dart';
import 'package:brick_breaker/ui/game/brick_breaker_game.dart';
import 'package:brick_breaker/ui/screens/game/game_viewmodel.dart';
import 'package:brick_breaker/ui/screens/settings/settings_viewmodel.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class BrickBreakerWorld extends Forge2DWorld
    with HasGameReference<BrickBreakerGame> {
  int _remainingBricks = 0;

  final SettingsViewModel settingsViewModel;
  final GameViewModel gameViewModel;

  BrickBreakerWorld(this.settingsViewModel, this.gameViewModel)
    : super(gravity: Vector2.zero());

  @override
  Future<void> onLoad() async {
    await _start();
  }

  Future<void> _start() async {
    await add(
      Walls(
        game.camera.viewport.virtualSize,
        1 * BrickBreakerGame.lengthFactor,
      ),
    );

    await add(
      Ball(
        radius: 4 * BrickBreakerGame.lengthFactor,
        position: game.camera.viewport.virtualSize * 0.5,
        speed: _getBallSpeed(),
      ),
    );

    await add(
      Paddle(
        size: Vector2(30, 6)..scale(BrickBreakerGame.lengthFactor),
        position: Vector2(
          0.5 * game.camera.viewport.virtualSize.x,
          0.9 * game.camera.viewport.virtualSize.y,
        ),
      ),
    );

    await add(
      BrickZone(
        size: Vector2(
          game.camera.viewport.virtualSize.x * 0.8,
          game.camera.viewport.virtualSize.y * 0.35,
        ),
        position: Vector2(
          game.camera.viewport.virtualSize.x * 0.1,
          game.camera.viewport.virtualSize.y * 0.1,
        ),
        numBricksX: 7,
        numBricksY: 10,
        spacingX: 5 * BrickBreakerGame.lengthFactor,
        spacingY: 5 * BrickBreakerGame.lengthFactor,
      ),
    );
  }

  double _getBallSpeed() {
    switch (settingsViewModel.difficulty) {
      case Difficulty.easy:
        return 10.0;
      case Difficulty.medium:
        return 15.0;
      case Difficulty.hard:
        return 20.0;
    }
  }

  void registerBrick() {
    _remainingBricks++;
  }

  void startGame() {
    for (final ball in children.whereType<Ball>()) {
      ball.launch();
    }
    gameViewModel.start();
  }

  void onBrickDestroyed() async {
    _remainingBricks--;
    if (_remainingBricks <= 0) {
      await game.lifecycleEventsProcessed;
      game.pauseEngine();
      game.overlays.add('LevelBeat');
      gameViewModel.levelBeat();
    }
  }

  void onBallLost() async {
    await game.lifecycleEventsProcessed;
    game.pauseEngine();
    game.overlays.add('GameOver');
    gameViewModel.gameOver();
  }
}
