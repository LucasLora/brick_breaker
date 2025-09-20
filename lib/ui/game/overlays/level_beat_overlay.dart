import 'package:brick_breaker/ui/game/brick_breaker_game.dart';
import 'package:brick_breaker/ui/game/widgets/game_overlay.dart';
import 'package:brick_breaker/ui/game/widgets/overlay_button.dart';
import 'package:flutter/material.dart';

class LevelBeatOverlay extends StatelessWidget {
  final BrickBreakerGame game;

  const LevelBeatOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return GameOverlay(
      title: 'PARABÉNS!',
      subtitle: 'Você completou o nível ${game.gameViewModel.levelNumber}',
      actions: [
        OverlayButton(
          context: context,
          text: "Níveis",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
