import 'package:brick_breaker/ui/screens/about/about_screen.dart';
import 'package:brick_breaker/ui/screens/about/about_viewmodel.dart';
import 'package:brick_breaker/ui/screens/settings/settings_screen.dart';
import 'package:brick_breaker/ui/screens/settings/settings_viewmodel.dart';
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BRICK BREAKER',
                  style: tt.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: cs.onSurface,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Edição Clássica',
                  textAlign: TextAlign.center,
                  style: tt.bodyLarge?.copyWith(color: cs.onSurface),
                ),
                const SizedBox(height: 36),
                AppButton(
                  label: 'Níveis',
                  icon: Icons.emoji_events_outlined,
                  onPressed: () => {},
                ),
                const SizedBox(height: 12),
                AppButton(
                  label: "Configurações",
                  icon: Icons.settings_outlined,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider(
                          create: (_) => SettingsViewModel(),
                          child: const SettingsScreen(),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),
                AppButton(
                  label: 'Sobre',
                  icon: Icons.info_outline_rounded,
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
                const SizedBox(height: 36),
                Center(
                  child: Text(
                    "Versão 1.0.0 - 2025",
                    textAlign: TextAlign.center,
                    style: tt.bodySmall?.copyWith(
                      color: cs.onSurface.withAlpha(180),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
