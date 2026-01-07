import 'package:go_router/go_router.dart';
import 'package:kings/widgets/web_page_transitioner.dart';
import '../pages/not_found_page.dart';
import '../pages/about_page.dart';
import '../pages/contact_page.dart';
import '../pages/home_page.dart';
import '../pages/projects.dart';

class Routes {
  static const String homePage = '/';
  static const String aboutPage = '/about';
  static const String projectsPage = '/projects';
  // static const String pricingPage = '/pricing';
  static const String contactPage = '/contact';
  static const String notFoundPage = '/404';
}

final GoRouter _router = GoRouter(
    initialLocation: Routes.homePage,
    errorPageBuilder: (context, state) => webPageTransitioner(
        context: context,
        state: state,
        child: const NotFoundPage(),
        title: "Not Found"),
    routes: [
      // homePage
      GoRoute(
          path: Routes.homePage,
          pageBuilder: (context, state) => webPageTransitioner(
              context: context,
              state: state,
              child: const HomePage(),
              title: "Stephen Kings")),
      // aboutPage
      GoRoute(
          path: Routes.aboutPage,
          pageBuilder: (context, state) => webPageTransitioner(
              context: context,
              state: state,
              child: const AboutPage(),
              title: "Stephen Kings - About Me")),
      // projectsPage
      GoRoute(
          path: Routes.projectsPage,
          pageBuilder: (context, state) => webPageTransitioner(
              context: context,
              state: state,
              child: const ProjectsPage(),
              title: "Stephen Kings - Projects")),
      // // pricingPage
      // GoRoute(
      //     path: Routes.pricingPage,
      //     pageBuilder: (context, state) => webPageTransitioner(
      //         context: context, state: state, child: const PricingPage(), title: "Stephen Kings - Pricing")),
      // contactPage
      GoRoute(
          path: Routes.contactPage,
          pageBuilder: (context, state) => webPageTransitioner(
              context: context,
              state: state,
              child: const ContactPage(),
              title: "Stephen Kings - Contact Me")),
    ]);

GoRouter get router => _router;
