import 'package:brick_breaker/models/enums/generation_type.dart';
import 'package:brick_breaker/models/level.dart';
import 'package:brick_breaker/ui/widgets/app_screen.dart';
import 'package:flutter/material.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final levels = List.generate(20, (i) {
      final number = i + 1;
      return Level(
        number: number,
        unlocked: number <= 5,
        generationType: number < 3
            ? GenerationType.manual
            : number < 5
            ? GenerationType.semiRandom
            : GenerationType.random,
      );
    });

    return AppScreen(
      headerIcon: Icons.emoji_events_outlined,
      headerTitle: "SELECIONAR NÍVEL",
      headerSubtitle: "Escolha o seu desafio",
      body: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemCount: levels.length,
          itemBuilder: (context, index) {
            final level = levels[index];
            if (!level.unlocked) {
              return _LockedLevelCard(number: level.number);
            }
            return _UnlockedLevelCard(level: level);
          },
        ),
      ],
    );
  }
}

class _UnlockedLevelCard extends StatelessWidget {
  final Level level;

  const _UnlockedLevelCard({required this.level});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Card(
      color: level.generationType.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // TODO: abrir o jogo no nível
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                level.number.toString(),
                style: tt.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: cs.onPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                level.generationType.name,
                style: tt.bodySmall?.copyWith(color: cs.onPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LockedLevelCard extends StatelessWidget {
  final int number;

  const _LockedLevelCard({required this.number});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Card(
      color: cs.surface.withAlpha(90),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.lock, color: Colors.white54),
            const SizedBox(height: 4),
            Text(
              number.toString(),
              style: tt.bodySmall?.copyWith(color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }
}
