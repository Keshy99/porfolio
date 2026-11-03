import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../app/theme.dart';
import '../../core/links.dart';
import '../../core/responsive.dart';
import '../../data/models/project.dart';
import '../../data/projects.dart';
import '../../shared/widgets/content_width.dart';
import '../../shared/widgets/site_scaffold.dart';
import 'widgets/platform_icons.dart';
import 'widgets/project_gallery.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final gallery = ProjectGallery(key: ValueKey(project.id), images: project.images);
    final info = _ProjectInfo(project: project);

    return SiteScaffold(
      currentRoute: Routes.projects,
      children: [
        ContentWidth(
          vertical: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: () => context.go(Routes.projects),
                icon: const Icon(Icons.arrow_back_rounded, size: 18),
                label: const Text('All projects'),
              ),
              const SizedBox(height: 24),
              if (context.isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: gallery),
                    const SizedBox(width: 48),
                    Expanded(flex: 2, child: info),
                  ],
                )
              else ...[
                info,
                const SizedBox(height: 32),
                gallery,
              ],
              const SizedBox(height: 64),
              _ProjectPager(project: project),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProjectInfo extends StatelessWidget {
  const _ProjectInfo({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(project.title, style: context.isMobile ? text.displaySmall : text.displayMedium),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final platform in project.platforms)
              Chip(
                avatar: Icon(platform.icon, size: 16, color: AppColors.accent),
                label: Text(platform.label),
              ),
          ],
        ),
        const SizedBox(height: 24),
        Text(project.description, style: text.bodyLarge?.copyWith(color: AppColors.textMuted, height: 1.7)),
        const SizedBox(height: 32),
        FilledButton.icon(
          onPressed: () => openLink(context, project.link),
          icon: Icon(project.isPlayStore ? Icons.shop_rounded : Icons.download_rounded),
          label: Text(project.linkLabel),
        ),
      ],
    );
  }
}

/// Previous / next project links at the bottom of the page.
class _ProjectPager extends StatelessWidget {
  const _ProjectPager({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final index = projects.indexOf(project);
    final previous = index > 0 ? projects[index - 1] : null;
    final next = index < projects.length - 1 ? projects[index + 1] : null;

    return Column(
      children: [
        const Divider(),
        const SizedBox(height: 16),
        Row(
          children: [
            if (previous != null)
              TextButton.icon(
                onPressed: () => context.go(Routes.project(previous.id)),
                icon: const Icon(Icons.arrow_back_rounded, size: 18),
                label: Text(previous.title),
              ),
            const Spacer(),
            if (next != null)
              TextButton.icon(
                onPressed: () => context.go(Routes.project(next.id)),
                iconAlignment: IconAlignment.end,
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(next.title),
              ),
          ],
        ),
      ],
    );
  }
}
