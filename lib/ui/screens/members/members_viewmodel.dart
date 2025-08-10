import 'package:flutter/material.dart';

class MembersViewModel extends ChangeNotifier {
  final List<String> _members = [
    'Gabriel Fachini de Freitas',
    'Helena Almeida Franco',
    'João Augusto Bortolanza',
    'Júlio Moreira Leite Neto',
    'Lucas Felippi Lóra',
    'Tiago Ribeiro de Barros',
  ];

  List<String> get members => _members;
}
