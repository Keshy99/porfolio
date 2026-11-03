import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/profile.dart';
import '../data/projects.dart';
import '../features/about/about_page.dart';
import '../features/contact/contact_page.dart';
import '../features/home/home_page.dart';
import '../features/not_found/not_found_page.dart';
import '../features/projects/project_detail_page.dart';
import '../features/projects/projects_page.dart';

abstract final class Routes {
  static const home = '/';
  static const about = '/about';
  static const projects = '/projects';
  static const contact = '/contact';

  static String project(String id) => '$projects/$id';
}

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.home,
  errorPageBuilder: (context, state) => _page(state, const NotFoundPage(), 'Not Found'),
  routes: [
    GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) => _page(state, const HomePage(), null),
    ),
    GoRoute(
      path: Routes.about,
      pageBuilder: (context, state) => _page(state, const AboutPage(), 'About Me'),
    ),
    GoRoute(
      path: Routes.projects,
      pageBuilder: (context, state) => _page(state, const ProjectsPage(), 'Projects'),
      routes: [
        GoRoute(
          path: ':id',
          pageBuilder: (context, state) {
            final project = findProject(state.pathParameters['id']!);
            if (project == null) return _page(state, const NotFoundPage(), 'Not Found');
            return _page(state, ProjectDetailPage(project: project), project.title);
          },
        ),
      ],
    ),
    GoRoute(
      path: Routes.contact,
      pageBuilder: (context, state) => _page(state, const ContactPage(), 'Contact Me'),
    ),
  ],
);

/// Fades pages in and sets the browser tab title.
CustomTransitionPage<void> _page(GoRouterState state, Widget child, String? title) {
  final fullTitle = title == null ? Profile.fullName : '${Profile.fullName} - $title';
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: Title(title: fullTitle, color: Colors.black, child: child),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut), child: child),
  );
}
