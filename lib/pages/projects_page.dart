// lib/pages/projects_page.dart
import 'package:flutter/material.dart';
import 'package:portfolio_web/model/project_model.dart';

import '../widgets/project_card.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  List<Project> get _projects => const [
    Project(
      title: "App 1 – Shoes Store",
      description: "An e-commerce Flutter app with Provider state management.",
      images: ["assets/app1_1.png", "assets/app1_2.png", "assets/app1_3.png"],
      githubUrl: "https://github.com/youruser/shoes_app_flutter",
      youtubeUrl: "https://www.youtube.com/watch?v=YOUR_VIDEO_1",
      releaseUrl: "https://github.com/youruser/shoes_app_flutter/releases",
    ),
    Project(
      title: "App 2 – Audio Player",
      description: "A Flutter audio player app with Firebase integration.",
      images: ["assets/app2_1.png", "assets/app2_2.png"],
      githubUrl: "https://github.com/youruser/audio_player_app",
      youtubeUrl: "https://www.youtube.com/watch?v=YOUR_VIDEO_2",
    ),
    Project(
      title: "App 3 – Hotel Booking",
      description: "A responsive hotel booking app built with Flutter Web.",
      images: ["assets/app3_1.png", "assets/app3_2.png", "assets/app3_3.png"],
      githubUrl: "https://github.com/youruser/hotel_booking_app",
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
