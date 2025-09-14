import 'package:flutter/material.dart';

enum GenerationType { manual, semiRandom, random }

extension GenerationTypeExtension on GenerationType {
  String get name {
    switch (this) {
      case GenerationType.manual:
        return "Fixo";
      case GenerationType.semiRandom:
        return "Misto";
      case GenerationType.random:
        return "Aleatório";
    }
  }

  Color get color {
    switch (this) {
      case GenerationType.manual:
        return Colors.green;
      case GenerationType.semiRandom:
        return Colors.orange;
      case GenerationType.random:
        return Colors.red;
    }
  }
}
