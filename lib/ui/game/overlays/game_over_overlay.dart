import 'package:brick_breaker/ui/game/brick_breaker_game.dart';
import 'package:brick_breaker/ui/game/widgets/game_overlay.dart';
import 'package:brick_breaker/ui/game/widgets/overlay_button.dart';
import 'package:brick_breaker/ui/screens/game/game_screen.dart';
import 'package:brick_breaker/ui/screens/game/game_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameOverOverlay extends StatelessWidget {
  final BrickBreakerGame game;

  const GameOverOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return GameOverlay(
      title: 'GAME OVER',
      subtitle: 'Você perdeu o nível ${game.gameViewModel.levelNumber}',
      actions: [
        OverlayButton(
          context: context,
          text: "Reiniciar",
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ChangeNotifierProvider(
                  create: (_) => GameViewModel(level: game.gameViewModel.level),
                  child: const GameScreen(),
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 8),
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
