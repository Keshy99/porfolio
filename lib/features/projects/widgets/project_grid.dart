import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../app/theme.dart';
import '../../../data/models/project.dart';
import '../../../shared/widgets/hover_builder.dart';
import 'platform_icons.dart';

/// Responsive grid of [ProjectCard]s: 1 column on phones, 2 on tablets, 3 on desktop.
class ProjectGrid extends StatelessWidget {
  const ProjectGrid({super.key, required this.projects});

  final List<Project> projects;

  static const _gap = 24.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final columns = width >= 900
            ? 3
            : width >= 560
                ? 2
                : 1;
        final cardWidth = (width - _gap * (columns - 1)) / columns;

        return Wrap(
          spacing: _gap,
          runSpacing: _gap,
          children: [
            for (final project in projects) SizedBox(width: cardWidth, child: ProjectCard(project: project)),
          ],
        );
      },
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return HoverBuilder(
      onTap: () => context.go(Routes.project(project.id)),
      builder: (context, hovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, hovered ? -6 : 0, 0),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: hovered ? AppColors.accent.withValues(alpha: 0.7) : AppColors.border),
          boxShadow: [
            if (hovered) BoxShadow(color: AppColors.accent.withValues(alpha: 0.08), blurRadius: 30, spreadRadius: 2),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Cover
            Container(
              height: 240,
              padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.surfaceHigh, Color(0xFF2A2716)],
                ),
              ),
              child: AnimatedScale(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                scale: hovered ? 1.04 : 1,
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(project.cover, fit: BoxFit.contain, alignment: Alignment.bottomCenter),
                ),
              ),
            ),
            // Details
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          project.title,
                          style: text.titleLarge,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      PlatformIcons(platforms: project.platforms),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    // Reserve 3 lines so cards in a row line up.
                    height: (text.bodyMedium!.fontSize! * 1.5) * 3,
                    child: Text(
                      project.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: text.bodyMedium?.copyWith(color: AppColors.textMuted, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'View project',
                        style: text.labelLarge?.copyWith(
                          color: hovered ? AppColors.accent : AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 6),
                      AnimatedSlide(
                        duration: const Duration(milliseconds: 200),
                        offset: Offset(hovered ? 0.3 : 0, 0),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          size: 18,
                          color: hovered ? AppColors.accent : AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
