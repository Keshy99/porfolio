import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage webPageTransitioner<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  required String title,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: Title(key: Key(title), color: Theme.of(context).primaryColor, title: title, child: child),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
