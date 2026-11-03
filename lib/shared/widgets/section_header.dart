import 'package:flutter/material.dart';

import '../../app/theme.dart';
import '../../core/responsive.dart';

/// Page / section title in the site's two-tone style, e.g. "My **Projects**".
class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.lead, required this.highlight, this.subtitle, this.eyebrow});

  final String lead;
  final String highlight;
  final String? subtitle;
  final String? eyebrow;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final titleStyle = (context.isMobile ? text.displaySmall : text.displayMedium)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (eyebrow != null) ...[
          Text(
            eyebrow!.toUpperCase(),
            style: text.labelLarge?.copyWith(color: AppColors.accent, letterSpacing: 2, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
        ],
        Text.rich(
          TextSpan(
            text: '$lead ',
            children: [TextSpan(text: highlight, style: const TextStyle(color: AppColors.accent))],
          ),
          style: titleStyle,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(subtitle!, style: text.titleMedium?.copyWith(color: AppColors.textMuted, height: 1.5)),
          ),
        ],
      ],
    );
  }
}
