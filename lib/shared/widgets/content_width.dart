import 'package:flutter/material.dart';

import '../../core/responsive.dart';

/// Centers [child], caps it at the site's max width and applies page padding.
class ContentWidth extends StatelessWidget {
  const ContentWidth({super.key, required this.child, this.vertical = 0});

  final Widget child;
  final double vertical;

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.pagePadding, vertical: vertical),
          child: child,
        ),
      ),
    );
  }
}
