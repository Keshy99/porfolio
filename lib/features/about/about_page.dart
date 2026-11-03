import 'package:flutter/material.dart';

import '../../app/router.dart';
import '../../app/theme.dart';
import '../../core/responsive.dart';
import '../../data/profile.dart';
import '../../shared/widgets/content_width.dart';
import '../../shared/widgets/section_header.dart';
import '../../shared/widgets/site_scaffold.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final stacked = !context.isDesktop;

    final photo = Container(
      width: stacked ? 220 : 320,
      height: stacked ? 220 : 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.accent, width: 2),
        image: const DecorationImage(image: AssetImage(Profile.photo), fit: BoxFit.cover),
      ),
    );

    final bio = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bio', style: text.headlineSmall?.copyWith(color: AppColors.accent)),
        const SizedBox(height: 12),
        Text(Profile.bio, style: text.bodyLarge?.copyWith(color: AppColors.textMuted, height: 1.8)),
        const SizedBox(height: 32),
        Text('Skills', style: text.headlineSmall?.copyWith(color: AppColors.accent)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [for (final skill in Profile.skills) Chip(label: Text(skill))],
        ),
      ],
    );

    return SiteScaffold(
      currentRoute: Routes.about,
      children: [
        ContentWidth(
          vertical: 64,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                eyebrow: 'About',
                lead: 'About',
                highlight: 'Me',
                subtitle: 'Let me tell you a few things..',
              ),
              const SizedBox(height: 48),
              if (stacked) ...[
                Center(child: photo),
                const SizedBox(height: 40),
                bio,
              ] else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [photo, const SizedBox(width: 64), Expanded(child: bio)],
                ),
              const SizedBox(height: 80),
              Text('What I do', style: text.headlineMedium),
              const SizedBox(height: 24),
              const _Services(),
            ],
          ),
        ),
      ],
    );
  }
}

class _Services extends StatelessWidget {
  const _Services();

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        const gap = 20.0;
        final columns = constraints.maxWidth >= 760 ? 3 : 1;
        final width = (constraints.maxWidth - gap * (columns - 1)) / columns;

        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            for (final service in Profile.services)
              Container(
                width: width,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(service.icon, color: AppColors.accent),
                    ),
                    const SizedBox(height: 16),
                    Text(service.title, style: text.titleLarge),
                    const SizedBox(height: 8),
                    Text(service.description, style: text.bodyMedium?.copyWith(color: AppColors.textMuted)),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
