import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../app/theme.dart';
import '../../core/responsive.dart';
import '../../data/profile.dart';
import '../../data/projects.dart';
import '../../shared/widgets/content_width.dart';
import '../../shared/widgets/section_header.dart';
import '../../shared/widgets/site_scaffold.dart';
import '../projects/widgets/project_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final seeAll = TextButton.icon(
      onPressed: () => context.go(Routes.projects),
      iconAlignment: IconAlignment.end,
      icon: const Icon(Icons.arrow_forward_rounded, size: 18),
      label: const Text('See all projects'),
    );

    return SiteScaffold(
      currentRoute: Routes.home,
      children: [
        const _Hero(),
        ContentWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Expanded(
                    child: SectionHeader(eyebrow: 'Recent work', lead: 'Featured', highlight: 'Projects'),
                  ),
                  if (!context.isMobile) seeAll,
                ],
              ),
              const SizedBox(height: 32),
              ProjectGrid(projects: projects.take(3).toList()),
              if (context.isMobile) ...[
                const SizedBox(height: 24),
                Center(child: seeAll),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero();

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final stacked = !context.isDesktop;

    final intro = Column(
      crossAxisAlignment: stacked ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.accent.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppColors.accent.withValues(alpha: 0.4)),
          ),
          child: Text(
            'Flutter Developer',
            style: text.labelLarge?.copyWith(color: AppColors.accent, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 20),
        Text.rich(
          const TextSpan(
            text: "Hi, I'm ${Profile.firstName} ",
            children: [TextSpan(text: Profile.lastName, style: TextStyle(color: AppColors.accent))],
          ),
          textAlign: stacked ? TextAlign.center : TextAlign.start,
          style: (context.isMobile ? text.displaySmall : text.displayLarge)?.copyWith(height: 1.1),
        ),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(
            Profile.tagline,
            textAlign: stacked ? TextAlign.center : TextAlign.start,
            style: text.titleLarge?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w400, height: 1.5),
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          alignment: stacked ? WrapAlignment.center : WrapAlignment.start,
          spacing: 12,
          runSpacing: 12,
          children: [
            for (final service in Profile.services)
              Chip(
                avatar: Icon(service.icon, size: 18, color: AppColors.accent),
                label: Text(service.title),
              ),
          ],
        ),
        const SizedBox(height: 32),
        Wrap(
          alignment: stacked ? WrapAlignment.center : WrapAlignment.start,
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton(onPressed: () => context.go(Routes.projects), child: const Text('View my work')),
            OutlinedButton(onPressed: () => context.go(Routes.contact), child: const Text('Contact me')),
          ],
        ),
        const SizedBox(height: 32),
        const SocialLinks(),
      ],
    );

    final photo = _Portrait(size: context.isMobile ? 200 : 320);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.background.withValues(alpha: 0.82), AppColors.background],
          ),
        ),
        child: ContentWidth(
          vertical: context.isMobile ? 48 : 96,
          child: stacked
              ? Column(children: [photo, const SizedBox(height: 40), intro])
              : Row(children: [Expanded(child: intro), const SizedBox(width: 64), photo]),
        ),
      ),
    );
  }
}

class _Portrait extends StatelessWidget {
  const _Portrait({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const SweepGradient(colors: [AppColors.accent, Color(0x00EECE1A), AppColors.accent]),
        boxShadow: [BoxShadow(color: AppColors.accent.withValues(alpha: 0.18), blurRadius: 60, spreadRadius: 4)],
      ),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.surface,
          image: DecorationImage(image: AssetImage(Profile.photo), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
