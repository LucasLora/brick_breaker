import 'package:flutter/material.dart';

class GameOverlay extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final List<Widget>? actions;

  const GameOverlay({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return actions != null && actions!.isNotEmpty
        ? myContainer(cs, tt, context, true)
        : InkWell(
            onTap: () => onTap?.call(),
            child: myContainer(cs, tt, context, false),
          );
  }

  Container myContainer(
    ColorScheme cs,
    TextTheme tt,
    BuildContext context,
    bool showButtons,
  ) {
    return Container(
      color: cs.surface.withAlpha(170),
      child: Center(
        child: Card(
          color: cs.surface,
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: tt.headlineLarge?.copyWith(color: cs.onPrimary),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: tt.titleMedium?.copyWith(color: cs.onPrimary),
                ),
                if (showButtons) ...[
                  const SizedBox(height: 16),
                  Row(mainAxisSize: MainAxisSize.min, children: actions!),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
