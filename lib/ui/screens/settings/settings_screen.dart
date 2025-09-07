import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'settings_viewmodel.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          "Voltar",
          style: tt.bodyMedium?.copyWith(color: cs.onSurface),
        ),
      ),
      body: Consumer<SettingsViewModel>(
        builder: (context, vm, _) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.settings_outlined,
                      size: 36,
                      color: cs.onSurface,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "CONFIGURAÇÕES",
                      style: tt.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: cs.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Personalize sua experiência",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: cs.onSurface),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _buildSectionCard(
                context,
                title: "ÁUDIO",
                icon: Icons.volume_up,
                children: [
                  SwitchListTile(
                    title: Text(
                      "Efeitos Sonoros",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: cs.onSurface,
                      ),
                    ),
                    subtitle: Text(
                      "Ativar sons do jogo",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: cs.onSurface),
                    ),
                    value: vm.soundOn,
                    onChanged: (_) => vm.toggleSound(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildSectionCard(
                context,
                title: "VIBRAÇÃO",
                icon: Icons.vibration,
                children: [
                  SwitchListTile(
                    title: Text(
                      "Feedback Tátil",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: cs.onSurface,
                      ),
                    ),
                    subtitle: Text(
                      "Vibração em ações do jogo",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: cs.onSurface),
                    ),
                    value: vm.vibrationOn,
                    onChanged: (_) => vm.toggleVibration(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildSectionCard(
                context,
                title: "JOGABILIDADE",
                icon: Icons.sports_esports,
                children: [
                  ListTile(
                    title: Text(
                      "Dificuldade Padrão",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: cs.onSurface,
                      ),
                    ),
                    subtitle: Text(
                      "Selecione a velocidade da bola",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: cs.onSurface),
                    ),
                    trailing: DropdownButton<String>(
                      value: vm.difficulty,
                      items: [
                        DropdownMenuItem(
                          value: "Easy",
                          child: Text(
                            "Fácil",
                            style: tt.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: cs.onSurface,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "Medium",
                          child: Text(
                            "Médio",
                            style: tt.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: cs.onSurface,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "Hard",
                          child: Text(
                            "Difícil",
                            style: tt.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: cs.onSurface,
                            ),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) vm.setDifficulty(value);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  "As configurações são salvas automaticamente",
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

  Widget _buildSectionCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Card(
      color: cs.surface.withAlpha(120),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: cs.onSurface),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: tt.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: cs.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }
}
