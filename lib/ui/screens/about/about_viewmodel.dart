import 'package:brick_breaker/ui/screens/about/member.dart';
import 'package:flutter/material.dart';

class AboutViewModel extends ChangeNotifier {
  final List<Member> _members = [
    Member(
      name: 'Gabriel Fachini de Freitas',
      imagePath: 'assets/profile_images/gabriel.png',
    ),
    Member(
      name: 'Helena Almeida Franco',
      imagePath: 'assets/profile_images/helena.png',
    ),
    Member(
      name: 'João Augusto Bortolanza',
      imagePath: 'assets/profile_images/joao.png',
    ),
    Member(
      name: 'Júlio Moreira Leite Neto',
      imagePath: 'assets/profile_images/julio.png',
    ),
    Member(
      name: 'Lucas Felippi Lóra',
      imagePath: 'assets/profile_images/lucas.png',
    ),
    Member(
      name: 'Tiago Ribeiro de Barros',
      imagePath: 'assets/profile_images/tiago.png',
    ),
  ];

  List<Member> get members => _members;
}
