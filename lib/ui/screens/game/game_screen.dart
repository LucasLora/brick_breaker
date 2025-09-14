import 'package:brick_breaker/ui/screens/game/game_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Consumer<GameViewModel>(
      builder: (context, vm, _) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: cs.surface,
            title: Row(
              children: [
                Text(
                  "Nível ${vm.levelNumber}",
                  style: tt.bodyLarge?.copyWith(color: cs.onPrimary),
                ),
                const SizedBox(width: 24),
                Text(
                  "Vidas ",
                  style: tt.bodyLarge?.copyWith(color: cs.onPrimary),
                ),
                Row(
                  children: List.generate(
                    3,
                    (index) => Icon(
                      index < vm.lives ? Icons.favorite : Icons.favorite_border,
                      color: cs.error,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.pause),
                onPressed: () {
                  // TODO: pausar o jogo
                },
              ),
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  // TODO: reiniciar o jogo
                },
              ),
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          body: const SafeArea(
            child:
                Placeholder(), //GameWidget.controlled(gameFactory: BrickBreakerGame.new),
          ),
        );
      },
    );
  }
}
