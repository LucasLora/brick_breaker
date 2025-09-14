import 'package:brick_breaker/models/enums/difficulty.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsViewModel extends ChangeNotifier {
  static const _keySound = 'sound_on';
  static const _keyVibration = 'vibration_on';
  static const _keyDifficulty = 'difficulty';

  bool _soundOn = true;
  bool _vibrationOn = true;
  Difficulty _difficulty = Difficulty.medium;

  bool get soundOn => _soundOn;
  bool get vibrationOn => _vibrationOn;
  Difficulty get difficulty => _difficulty;

  SettingsViewModel() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _soundOn = prefs.getBool(_keySound) ?? true;
    _vibrationOn = prefs.getBool(_keyVibration) ?? true;
    final difficultyIndex = prefs.getInt(_keyDifficulty) ?? 1;
    _difficulty = Difficulty.values.firstWhere(
      (x) => x.index == difficultyIndex,
      orElse: () => Difficulty.medium,
    );
    notifyListeners();
  }

  Future<void> toggleSound() async {
    _soundOn = !_soundOn;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keySound, _soundOn);
  }

  Future<void> toggleVibration() async {
    _vibrationOn = !_vibrationOn;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyVibration, _vibrationOn);
  }

  Future<void> setDifficulty(Difficulty value) async {
    _difficulty = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyDifficulty, value.index);
  }
}
