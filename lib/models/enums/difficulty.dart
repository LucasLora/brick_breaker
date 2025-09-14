enum Difficulty { easy, medium, hard }

extension DifficultyExtension on Difficulty {
  String get name {
    switch (this) {
      case Difficulty.easy:
        return "Fácil";
      case Difficulty.medium:
        return "Médio";
      case Difficulty.hard:
        return "Difícil";
    }
  }
}
