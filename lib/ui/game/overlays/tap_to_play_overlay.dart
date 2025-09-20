import 'package:brick_breaker/ui/game/brick_breaker_game.dart';
import 'package:flutter/material.dart';

class TapToPlayOverlay extends StatelessWidget {
  final BrickBreakerGame game;

  const TapToPlayOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        game.overlays.remove('TapToPlay');
        game.resumeEngine();
        game.startGame();
      },
      child: Container(
        color: Colors.black45,
        child: Center(
          child: Card(
            color: cs.surface,
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Toque para jogar', style: tt.headlineSmall),
                  const SizedBox(height: 8),
                  Text(
                    'Nível ${game.gameViewModel.levelNumber}',
                    style: tt.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Toque em qualquer lugar para começar',
                    style: tt.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
