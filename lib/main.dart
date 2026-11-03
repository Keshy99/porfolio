import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'app/app.dart';

void main() {
  // Clean URLs (/projects instead of /#/projects).
  usePathUrlStrategy();
  runApp(const PortfolioApp());
}
