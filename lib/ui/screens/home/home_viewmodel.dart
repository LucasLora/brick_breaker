import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool soundOn = true;
  int selectedLevel = 1;

  void toggleSound() {
    soundOn = !soundOn;
    notifyListeners();
  }

  void setLevel(int level) {
    selectedLevel = level;
    notifyListeners();
  }
}
