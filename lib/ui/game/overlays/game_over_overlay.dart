import 'package:brick_breaker/ui/game/brick_breaker_game.dart';
import 'package:brick_breaker/ui/screens/game/game_screen.dart';
import 'package:brick_breaker/ui/screens/game/game_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameOverOverlay extends StatelessWidget {
  final BrickBreakerGame game;

  const GameOverOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Center(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        color: cs.surface,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Game Over', style: tt.headlineSmall),
              const SizedBox(height: 12),
              Text(
                'Você perdeu o nível ${game.gameViewModel.levelNumber}.',
                style: tt.bodyMedium,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChangeNotifierProvider(
                            create: (_) =>
                                GameViewModel(level: game.gameViewModel.level),
                            child: const GameScreen(),
                          ),
                        ),
                      );
                    },
                    child: const Text('Reiniciar'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Níveis'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
