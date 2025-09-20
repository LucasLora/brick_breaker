import 'package:brick_breaker/models/group_member.dart';
import 'package:flutter/material.dart';

class AboutViewModel extends ChangeNotifier {
  final List<GroupMember> _members = [
    GroupMember(
      name: 'Gabriel Fachini de Freitas',
      imagePath: 'assets/profile_images/gabriel.png',
    ),
    GroupMember(
      name: 'Helena Almeida Franco',
      imagePath: 'assets/profile_images/helena.png',
    ),
    GroupMember(
      name: 'João Augusto Bortolanza',
      imagePath: 'assets/profile_images/joao.png',
    ),
    GroupMember(
      name: 'Júlio Moreira Leite Neto',
      imagePath: 'assets/profile_images/julio.png',
    ),
    GroupMember(
      name: 'Lucas Felippi Lóra',
      imagePath: 'assets/profile_images/lucas.png',
    ),
    GroupMember(
      name: 'Tiago Ribeiro de Barros',
      imagePath: 'assets/profile_images/tiago.png',
    ),
  ];

  List<GroupMember> get members => List.unmodifiable(_members);
}
