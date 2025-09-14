import 'package:brick_breaker/models/level.dart';
import 'package:flutter/material.dart';

class GameViewModel extends ChangeNotifier {
  final Level level;

  GameViewModel({required this.level});

  int get levelNumber => level.number;

  int _lives = 3;
  int get lives => _lives;

  void loseLife() {
    if (_lives > 0) {
      _lives--;
      notifyListeners();
    }
  }
}
