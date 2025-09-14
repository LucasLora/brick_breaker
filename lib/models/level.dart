import 'package:brick_breaker/models/enums/generation_type.dart';

class Level {
  final int number;
  final bool unlocked;
  final GenerationType generationType;

  Level({
    required this.number,
    required this.unlocked,
    required this.generationType,
  });
}
