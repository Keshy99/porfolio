import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../app/theme.dart';
import '../../shared/widgets/content_width.dart';
import '../../shared/widgets/site_scaffold.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return SiteScaffold(
      // No nav item is highlighted on the 404 page.
      currentRoute: '',
      children: [
        ContentWidth(
          vertical: 64,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/404.gif', width: 500, fit: BoxFit.cover),
              ),
              const SizedBox(height: 40),
              Text('Page Not Found', style: text.displaySmall, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              Text(
                'Sorry! The page you are looking for does not exist',
                style: text.bodyLarge?.copyWith(color: AppColors.textMuted),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: () => context.go(Routes.home),
                icon: const Icon(Icons.home_rounded),
                label: const Text('Go Home'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
