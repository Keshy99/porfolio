import 'package:flutter/material.dart';

import '../../../app/theme.dart';
import '../../../data/models/project.dart';

extension ProjectPlatformUi on ProjectPlatform {
  IconData get icon => switch (this) {
        ProjectPlatform.web => Icons.language_rounded,
        ProjectPlatform.android => Icons.android_rounded,
        ProjectPlatform.ios => Icons.apple_rounded,
      };

  String get label => switch (this) {
        ProjectPlatform.web => 'Web',
        ProjectPlatform.android => 'Android',
        ProjectPlatform.ios => 'iOS',
      };
}

/// Small row of platform icons with tooltips.
class PlatformIcons extends StatelessWidget {
  const PlatformIcons({super.key, required this.platforms, this.size = 18});

  final List<ProjectPlatform> platforms;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final platform in platforms)
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Tooltip(
              message: platform.label,
              child: Icon(platform.icon, size: size, color: AppColors.textMuted),
            ),
          ),
      ],
    );
  }
}
