import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget? leading;
  final String? title;
  final String? subtitle;
  final List<Widget>? children;
  final VoidCallback? onTap;

  const AppCard({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.children,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Card(
      color: cs.primary.withAlpha(110),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (leading != null) ...[leading!, const SizedBox(width: 12)],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (title != null)
                          Text(
                            title!,
                            style: tt.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: cs.onPrimary,
                            ),
                          ),
                        if (subtitle != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            subtitle!,
                            style: tt.bodySmall?.copyWith(
                              color: cs.onPrimary.withAlpha(200),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              if (children != null && children!.isNotEmpty) ...[
                const SizedBox(height: 12),
                ...children!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
