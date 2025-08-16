import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool _soundOn = true;

  bool get soundOn => _soundOn;

  void toggleSound() {
    _soundOn = !_soundOn;
    notifyListeners();
  }
}
