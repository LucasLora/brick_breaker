import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final List<String> _members = ['Lucas Lora'];

  bool soundOn = true;
  int selectedLevel = 1;

  List<String> get members => List.unmodifiable(_members);

  void toggleSound() {
    soundOn = !soundOn;
    notifyListeners();
  }

  void setLevel(int level) {
    selectedLevel = level;
    notifyListeners();
  }
}
