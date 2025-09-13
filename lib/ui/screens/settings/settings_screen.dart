import 'package:brick_breaker/ui/widgets/app_card.dart';
import 'package:brick_breaker/ui/widgets/app_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'settings_viewmodel.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return AppScreen(
      headerIcon: Icons.settings_outlined,
      headerTitle: "CONFIGURAÇÕES",
      headerSubtitle: "Personalize sua experiência",
      footerText: "As configurações são salvas automaticamente",
      body: [
        Consumer<SettingsViewModel>(
          builder: (context, vm, _) {
            return Column(
              children: [
                AppCard(
                  leading: const Icon(Icons.volume_up),
                  title: "ÁUDIO",
                  children: [
                    SwitchListTile(
                      title: Text(
                        "Efeitos Sonoros",
                        style: tt.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: cs.onPrimary,
                        ),
                      ),
                      subtitle: Text(
                        "Ativar sons do jogo",
                        style: tt.bodySmall?.copyWith(
                          color: cs.onPrimary.withAlpha(200),
                        ),
                      ),
                      value: vm.soundOn,
                      onChanged: (_) => vm.toggleSound(),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                AppCard(
                  leading: const Icon(Icons.vibration),
                  title: "VIBRAÇÃO",
                  children: [
                    SwitchListTile(
                      title: Text(
                        "Feedback Tátil",
                        style: tt.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: cs.onPrimary,
                        ),
                      ),
                      subtitle: Text(
                        "Vibração em ações do jogo",
                        style: tt.bodySmall?.copyWith(
                          color: cs.onPrimary.withAlpha(200),
                        ),
                      ),
                      value: vm.vibrationOn,
                      onChanged: (_) => vm.toggleVibration(),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                AppCard(
                  leading: const Icon(Icons.sports_esports),
                  title: "JOGABILIDADE",
                  children: [
                    ListTile(
                      title: Text(
                        "Dificuldade Padrão",
                        style: tt.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: cs.onPrimary,
                        ),
                      ),
                      subtitle: Text(
                        "Selecione a velocidade da bola",
                        style: tt.bodySmall?.copyWith(
                          color: cs.onPrimary.withAlpha(200),
                        ),
                      ),
                      trailing: DropdownButton<String>(
                        value: vm.difficulty,
                        items: [
                          DropdownMenuItem(
                            value: "Easy",
                            child: Text(
                              "Fácil",
                              style: tt.bodySmall?.copyWith(
                                color: cs.onPrimary.withAlpha(200),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Medium",
                            child: Text(
                              "Médio",
                              style: tt.bodySmall?.copyWith(
                                color: cs.onPrimary.withAlpha(200),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Hard",
                            child: Text(
                              "Difícil",
                              style: tt.bodySmall?.copyWith(
                                color: cs.onPrimary.withAlpha(200),
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
              ],
            );
          },
        ),
      ],
    );
  }
}
