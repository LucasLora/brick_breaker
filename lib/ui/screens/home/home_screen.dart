import 'package:brick_breaker/ui/screens/about/about_screen.dart';
import 'package:brick_breaker/ui/screens/about/about_viewmodel.dart';
import 'package:brick_breaker/ui/screens/levels/levels_screen.dart';
import 'package:brick_breaker/ui/screens/levels/levels_viewmodel.dart';
import 'package:brick_breaker/ui/screens/settings/settings_screen.dart';
import 'package:brick_breaker/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'BRICK BREAKER',
                        textAlign: TextAlign.center,
                        style: tt.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: cs.onPrimary,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        'Edição Clássica',
                        textAlign: TextAlign.center,
                        style: tt.headlineSmall?.copyWith(
                          color: cs.onPrimary.withAlpha(102),
                        ),
                      ),

                      const SizedBox(height: 24),

                      AppButton(
                        icon: Icons.emoji_events_outlined,
                        text: 'Níveis',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChangeNotifierProvider(
                                create: (_) => LevelsViewModel(),
                                child: const LevelsScreen(),
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 12),

                      AppButton(
                        icon: Icons.settings_outlined,
                        text: "Configurações",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SettingsScreen(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 12),

                      AppButton(
                        icon: Icons.info_outline_rounded,
                        text: 'Sobre',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChangeNotifierProvider(
                                create: (_) => AboutViewModel(),
                                child: const AboutScreen(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Text(
                "Versão 1.0.0 - 2025",
                textAlign: TextAlign.center,
                style: tt.labelLarge?.copyWith(
                  color: cs.onPrimary.withAlpha(102),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
