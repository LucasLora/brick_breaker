import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  static const String appBarText = "Voltar";

  final IconData? headerIcon;
  final String? headerTitle;
  final String? headerSubtitle;

  final List<Widget>? body;

  final String? footerText;

  const AppScreen({
    super.key,
    this.headerIcon,
    this.headerTitle,
    this.headerSubtitle,
    this.body,
    this.footerText,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          AppScreen.appBarText,
          style: tt.titleMedium?.copyWith(color: cs.onPrimary),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            if (headerIcon != null ||
                (headerTitle != null && headerTitle!.isNotEmpty))
              buildHeader(cs, tt),

            if (body != null && body!.isNotEmpty)
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: body!,
                  ),
                ),
              )
            else
              const Spacer(),

            if (footerText != null && footerText!.isNotEmpty)
              buildFooter(cs, tt),
          ],
        ),
      ),
    );
  }

  Center buildHeader(ColorScheme cs, TextTheme tt) {
    return Center(
      child: Column(
        children: [
          if (headerIcon != null) ...[
            Icon(headerIcon, size: 48, color: cs.onPrimary),
            const SizedBox(height: 8),
          ],
          if (headerTitle != null && headerTitle!.isNotEmpty) ...[
            Text(
              headerTitle!,
              style: tt.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: cs.onPrimary,
              ),
            ),
            const SizedBox(height: 8),
            if (headerSubtitle != null && headerSubtitle!.isNotEmpty)
              Text(
                headerSubtitle!,
                style: tt.titleSmall?.copyWith(color: cs.onPrimary),
              ),
          ],
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildFooter(ColorScheme cs, TextTheme tt) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Center(
        child: Text(
          footerText!,
          textAlign: TextAlign.center,
          style: tt.labelLarge?.copyWith(color: cs.onPrimary.withAlpha(102)),
        ),
      ),
    );
  }
}
