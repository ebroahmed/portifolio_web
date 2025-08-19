// lib/pages/projects_page.dart
import 'package:flutter/material.dart';
import 'package:portfolio_web/model/project_model.dart';
import '../widgets/project_card.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  // 🔁 Replace with your real data (GitHub/YouTube/Release links)
  List<Project> get _projects => const [
    Project(
      title: 'App 1 – Your Title',
      description:
          'Short description about what this app does and the tech used (Flutter, Riverpod, Firebase, etc).',
      image: 'https://picsum.photos/seed/app1/1200/675', // or 'assets/app1.png'
      githubUrl: 'https://github.com/your-user/your-repo-1',
      youtubeUrl: 'https://www.youtube.com/watch?v=YOUR_VIDEO_1',
      releaseUrl:
          'https://github.com/your-user/your-repo-1/releases', // or a web demo link
    ),
    Project(
      title: 'App 2 – Your Title',
      description:
          'Brief description highlighting features and your role (UI/State mgmt/Testing).',
      image: 'https://picsum.photos/seed/app2/1200/675',
      githubUrl: 'https://github.com/your-user/your-repo-2',
      youtubeUrl: 'https://www.youtube.com/watch?v=YOUR_VIDEO_2',
      releaseUrl: 'https://github.com/your-user/your-repo-2/releases',
    ),
    Project(
      title: 'App 3 – Your Title',
      description:
          'Mention problems solved, libraries used, and performance or testing notes.',
      image: 'https://picsum.photos/seed/app3/1200/675',
      githubUrl: 'https://github.com/your-user/your-repo-3',
      youtubeUrl: 'https://www.youtube.com/watch?v=YOUR_VIDEO_3',
      releaseUrl: 'https://github.com/your-user/your-repo-3/releases',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final w = c.maxWidth;
        int columns = 1;
        if (w >= 1200) {
          columns = 3;
        } else if (w >= 800) {
          columns = 2;
        }

        return GridView.builder(
          padding: const EdgeInsets.all(32),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 16 / 12,
          ),
          itemCount: _projects.length,
          itemBuilder: (context, i) => ProjectCard(project: _projects[i]),
        );
      },
    );
  }
}
