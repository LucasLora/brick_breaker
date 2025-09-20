import 'package:brick_breaker/ui/game/brick_breaker_game.dart';
import 'package:brick_breaker/ui/game/widgets/game_overlay.dart';
import 'package:flutter/material.dart';

class TapToPlayOverlay extends StatelessWidget {
  final BrickBreakerGame game;

  const TapToPlayOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return GameOverlay(
      title: 'Nível ${game.gameViewModel.levelNumber}',
      subtitle: 'Toque em qualquer lugar para começar',
      onTap: () {
        game.overlays.remove('TapToPlay');
        game.resumeEngine();
        game.startGame();
      },
    );
  }
}
