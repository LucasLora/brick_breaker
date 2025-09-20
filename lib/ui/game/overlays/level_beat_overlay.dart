import 'package:brick_breaker/ui/game/brick_breaker_game.dart';
import 'package:flutter/material.dart';

class LevelBeatOverlay extends StatelessWidget {
  final BrickBreakerGame game;

  const LevelBeatOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Center(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        color: cs.surface,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Parabéns!', style: tt.headlineSmall),
              const SizedBox(height: 12),
              Text(
                'Você completou o nível ${game.gameViewModel.levelNumber}.',
                style: tt.bodyMedium,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Níveis'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
