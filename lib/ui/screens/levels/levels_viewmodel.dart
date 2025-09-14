import 'package:brick_breaker/models/enums/generation_type.dart';
import 'package:brick_breaker/models/level.dart';
import 'package:flutter/material.dart';

class LevelsViewModel extends ChangeNotifier {
  final List<Level> _levels = List.generate(12, (i) {
    final levelNumber = i + 1;
    return Level(
      number: levelNumber,
      generationType: switch (levelNumber) {
        1 => GenerationType.manual,
        2 => GenerationType.semiRandom,
        _ => GenerationType.random,
      },
      unlocked: levelNumber <= 3,
    );
  });

  List<Level> get levels => List.unmodifiable(_levels);

  Level getLevel(int levelNumber) => _levels[levelNumber - 1];
}
