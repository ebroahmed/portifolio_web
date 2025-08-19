import 'package:flutter/material.dart';
import 'package:portfolio_web/model/project_model.dart';
import 'package:portfolio_web/widgets/projects_grid.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      Project(
        title: "Awesome Flutter App",
        description: "A cool project showcasing Flutter skills.",
        images: [
          "assets/screenshots/app1_1.png",
          "assets/screenshots/app1_2.png",
        ],
        githubUrl: "https://github.com/your-username/app1",
        youtubeUrl: "https://youtube.com/watch?v=xxx",
        releaseUrl: "https://github.com/your-username/app1/releases",
      ),
      // add more Project objects here
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Projects")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ProjectGrid(projects: projects),
      ),
    );
  }
}
