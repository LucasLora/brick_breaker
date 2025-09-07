import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'about_viewmodel.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          "Voltar",
          style: tt.titleMedium?.copyWith(color: cs.onSurface),
        ),
      ),
      body: Consumer<AboutViewModel>(
        builder: (context, vm, _) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      size: 36,
                      color: cs.onSurface,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "SOBRE O JOGO",
                      style: tt.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: cs.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Equipe de Desenvolvimento",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: cs.onSurface),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Card(
                color: cs.surface.withAlpha(120),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: ListTile(
                    title: Text(
                      "Brick Breaker - Ediçao Clássica",
                      style: tt.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: cs.onSurface,
                      ),
                    ),
                    subtitle: Text(
                      "Uma recriação moderna do clássico jogo Brick Breaker da Atari (1976).",
                      style: tt.bodyMedium?.copyWith(color: cs.onSurface),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ...vm.members.map((member) {
                return Card(
                  color: cs.surface.withAlpha(120),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(member.imagePath),
                      ),
                      title: Text(
                        member.name,
                        style: tt.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: cs.onSurface,
                        ),
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  "Inspirado no clássico Brick Breaker da Atari\n© 2025 - Todos os direitos reservados",
                  textAlign: TextAlign.center,
                  style: tt.bodySmall?.copyWith(
                    color: cs.onSurface.withAlpha(180),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
