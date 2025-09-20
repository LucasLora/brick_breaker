import 'package:brick_breaker/ui/game/brick_breaker_game.dart';
import 'package:brick_breaker/ui/game/overlays/game_over_overlay.dart';
import 'package:brick_breaker/ui/game/overlays/level_beat_overlay.dart';
import 'package:brick_breaker/ui/game/overlays/tap_to_play_overlay.dart';
import 'package:brick_breaker/ui/screens/game/game_viewmodel.dart';
import 'package:brick_breaker/ui/screens/settings/settings_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
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
            backgroundColor: cs.surface,
            title: Row(
              children: [
                Text(
                  "Nível ${vm.levelNumber}",
                  style: tt.bodyLarge?.copyWith(color: cs.onPrimary),
                ),
                // Todo: lives management
                // const SizedBox(width: 24),
                // Text(
                //   "Vidas ",
                //   style: tt.bodyLarge?.copyWith(color: cs.onPrimary),
                // ),
                // Row(
                //   children: List.generate(
                //     3,
                //     (index) => Icon(
                //       index < vm.lives ? Icons.favorite : Icons.favorite_border,
                //       color: cs.error,
                //       size: 18,
                //     ),
                //   ),
                // ),
              ],
            ),
            // Todo: pause/resume and reset
            // actions: [
            //   IconButton(
            //     icon: vm.state == GameState.paused
            //         ? const Icon(Icons.play_arrow)
            //         : const Icon(Icons.pause),
            //     onPressed: () {
            //       if (vm.state == GameState.paused) {
            //         vm.start();
            //       } else if (vm.state == GameState.running) {
            //         vm.pause();
            //       }
            //     },
            //   ),
            //   IconButton(
            //     icon: const Icon(Icons.refresh),
            //     onPressed: () {
            //       vm.reset();
            //     },
            //   ),
            // ],
          ),
          body: SafeArea(
            child: GameWidget.controlled(
              gameFactory: () => BrickBreakerGame(
                context.read<SettingsViewModel>(),
                context.read<GameViewModel>(),
              ),
              overlayBuilderMap: {
                'TapToPlay': (_, BrickBreakerGame game) =>
                    TapToPlayOverlay(game: game),
                'GameOver': (_, BrickBreakerGame game) =>
                    GameOverOverlay(game: game),
                'LevelBeat': (_, BrickBreakerGame game) =>
                    LevelBeatOverlay(game: game),
              },
              initialActiveOverlays: const <String>['TapToPlay'],
            ),
          ),
        );
      },
    );
  }
}
