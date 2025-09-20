import 'package:brick_breaker/models/enums/game_state.dart';
import 'package:brick_breaker/models/enums/generation_type.dart';
import 'package:brick_breaker/models/level.dart';
import 'package:flutter/material.dart';

class GameViewModel extends ChangeNotifier {
  final Level _level;

  GameViewModel({required Level level}) : _level = level;

  Level get level => _level;
  int get levelNumber => _level.number;
  GenerationType get generationType => _level.generationType;

  // Todo: lives management
  //int _lives = 3;
  //int get lives => _lives;

  GameState _state = GameState.idle;
  GameState get state => _state;

  void start() {
    _state = GameState.running;
    notifyListeners();
  }

  void gameOver() {
    _state = GameState.gameOver;
    notifyListeners();
  }

  void levelBeat() {
    _state = GameState.levelBeat;
    notifyListeners();
  }
}
