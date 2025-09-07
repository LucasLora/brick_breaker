import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsViewModel extends ChangeNotifier {
  static const _keySound = 'sound_on';
  static const _keyVibration = 'vibration_on';
  static const _keyDifficulty = 'difficulty';

  bool _soundOn = true;
  bool _vibrationOn = true;
  String _difficulty = "Medium";

  bool get soundOn => _soundOn;
  bool get vibrationOn => _vibrationOn;
  String get difficulty => _difficulty;

  SettingsViewModel() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _soundOn = prefs.getBool(_keySound) ?? true;
    _vibrationOn = prefs.getBool(_keyVibration) ?? true;
    _difficulty = prefs.getString(_keyDifficulty) ?? "Medium";
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

  Future<void> setDifficulty(String value) async {
    _difficulty = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyDifficulty, value);
  }
}
