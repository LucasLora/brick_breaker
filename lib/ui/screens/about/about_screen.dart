import 'package:brick_breaker/ui/widgets/app_card.dart';
import 'package:brick_breaker/ui/widgets/app_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'about_viewmodel.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return AppScreen(
      headerIcon: Icons.info_outline_rounded,
      headerTitle: "SOBRE O JOGO",
      headerSubtitle: "Equipe de Desenvolvimento",
      footerText:
          "Inspirado no clássico Brick Breaker da Atari\n© 2025 - Todos os direitos reservados",
      body: [
        AppCard(
          title: "Brick Breaker - Edição Clássica",
          subtitle:
              "Uma recriação moderna do clássico jogo Brick Breaker da Atari (1976).",
        ),

        const SizedBox(height: 12),

        Consumer<AboutViewModel>(
          builder: (context, vm, _) {
            return Column(
              children: vm.members.map((member) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: AppCard(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        member.imagePath,
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) {
                          return CircleAvatar(
                            radius: 28,
                            backgroundColor: cs.primary,
                            child: Text(
                              member.name.isNotEmpty ? member.name[0] : '?',
                              style: tt.titleMedium?.copyWith(
                                color: cs.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    title: member.name,
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
