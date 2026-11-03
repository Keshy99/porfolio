import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens [url] externally, showing a snackbar instead of throwing if it fails.
Future<void> openLink(BuildContext context, String url) async {
  final messenger = ScaffoldMessenger.maybeOf(context);
  final opened = await launchUrl(Uri.parse(url), webOnlyWindowName: '_blank').catchError((_) => false);
  if (!opened) {
    messenger?.showSnackBar(SnackBar(content: Text('Could not open $url')));
  }
}
