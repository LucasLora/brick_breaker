import 'package:flutter/material.dart';

class OverlayButton extends StatelessWidget {
  final BuildContext context;
  final String text;
  final VoidCallback onPressed;

  const OverlayButton({
    super.key,
    required this.context,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return SizedBox(
      width: 125,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: cs.primary,
          foregroundColor: cs.onPrimary,
          textStyle: tt.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
