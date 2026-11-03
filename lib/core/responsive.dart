import 'package:flutter/widgets.dart';

/// Width breakpoints shared by every page.
abstract final class Breakpoints {
  static const double tablet = 600;
  static const double desktop = 1024;
  static const double maxContentWidth = 1200;
}

extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  bool get isMobile => screenWidth < Breakpoints.tablet;
  bool get isTablet => screenWidth >= Breakpoints.tablet && screenWidth < Breakpoints.desktop;
  bool get isDesktop => screenWidth >= Breakpoints.desktop;

  /// Horizontal page padding for the current width.
  double get pagePadding => isMobile ? 20 : 32;
}
