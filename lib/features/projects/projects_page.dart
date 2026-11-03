import 'package:flutter/material.dart';

import '../../app/router.dart';
import '../../data/projects.dart';
import '../../shared/widgets/content_width.dart';
import '../../shared/widgets/section_header.dart';
import '../../shared/widgets/site_scaffold.dart';
import 'widgets/project_grid.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      currentRoute: Routes.projects,
      children: [
        ContentWidth(
          vertical: 64,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                eyebrow: 'Portfolio',
                lead: 'My',
                highlight: 'Projects',
                subtitle: 'I have worked on a number of projects, some of which are listed below.',
              ),
              const SizedBox(height: 48),
              ProjectGrid(projects: projects),
            ],
          ),
        ),
      ],
    );
  }
}
