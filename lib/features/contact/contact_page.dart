import 'package:flutter/material.dart';

import '../../app/router.dart';
import '../../app/theme.dart';
import '../../core/links.dart';
import '../../data/profile.dart';
import '../../shared/widgets/content_width.dart';
import '../../shared/widgets/hover_builder.dart';
import '../../shared/widgets/section_header.dart';
import '../../shared/widgets/site_scaffold.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      currentRoute: Routes.contact,
      children: [
        ContentWidth(
          vertical: 64,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                eyebrow: 'Get in touch',
                lead: 'Contact',
                highlight: 'Me',
                subtitle: 'You can reach me via any of the following channels:',
              ),
              const SizedBox(height: 48),
              LayoutBuilder(
                builder: (context, constraints) {
                  const gap = 20.0;
                  final columns = constraints.maxWidth >= 900
                      ? 3
                      : constraints.maxWidth >= 560
                          ? 2
                          : 1;
                  final width = (constraints.maxWidth - gap * (columns - 1)) / columns;

                  return Wrap(
                    spacing: gap,
                    runSpacing: gap,
                    children: [
                      for (final channel in Profile.contacts)
                        SizedBox(width: width, child: _ContactCard(channel: channel)),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({required this.channel});

  final ContactChannel channel;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return HoverBuilder(
      onTap: () => openLink(context, channel.url),
      builder: (context, hovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        transform: Matrix4.translationValues(0, hovered ? -4 : 0, 0),
        decoration: BoxDecoration(
          color: hovered ? AppColors.accent : AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: hovered ? AppColors.accent : AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: hovered ? Colors.black.withValues(alpha: 0.12) : AppColors.accent.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(channel.icon, color: hovered ? Colors.black : AppColors.accent),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    channel.label,
                    style: text.labelMedium?.copyWith(color: hovered ? Colors.black54 : AppColors.textMuted),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    channel.value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: text.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: hovered ? Colors.black : AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_outward_rounded, size: 18, color: hovered ? Colors.black : AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}
