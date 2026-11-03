enum ProjectPlatform { web, android, ios }

class Project {
  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.link,
    required this.platforms,
  });

  /// URL slug used in /projects/:id.
  final String id;
  final String title;
  final String description;

  /// Asset paths; the first one is the cover image.
  final List<String> images;

  /// Play Store page or a direct download.
  final String link;
  final List<ProjectPlatform> platforms;

  String get cover => images.first;
  bool get isPlayStore => link.contains('play.google.com');
  String get linkLabel => isPlayStore ? 'Get it on Google Play' : 'Download APK';
}
