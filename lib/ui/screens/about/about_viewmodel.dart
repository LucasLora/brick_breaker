import 'package:brick_breaker/models/member.dart';
import 'package:flutter/material.dart';

class AboutViewModel extends ChangeNotifier {
  final List<GroupMember> _members = [
    GroupMember(
      name: 'Gabriel Fachini de Freitas',
      imagePath: 'lib/assets/profile_images/gabriel.png',
    ),
    GroupMember(
      name: 'Helena Almeida Franco',
      imagePath: 'lib/assets/profile_images/helena.png',
    ),
    GroupMember(
      name: 'João Augusto Bortolanza',
      imagePath: 'lib/assets/profile_images/joao.png',
    ),
    GroupMember(
      name: 'Júlio Moreira Leite Neto',
      imagePath: 'lib/assets/profile_images/julio.png',
    ),
    GroupMember(
      name: 'Lucas Felippi Lóra',
      imagePath: 'lib/assets/profile_images/lucas.png',
    ),
    GroupMember(
      name: 'Tiago Ribeiro de Barros',
      imagePath: 'lib/assets/profile_images/tiago.png',
    ),
  ];

  List<GroupMember> get members => _members;
}
