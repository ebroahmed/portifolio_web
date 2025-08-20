// lib/widgets/project_grid.dart
import 'package:flutter/material.dart';
import 'package:portfolio_web/model/project_model.dart';
import 'package:portfolio_web/widgets/project_card.dart';

class ProjectGrid extends StatelessWidget {
  final List<Project> projects;

  const ProjectGrid({super.key, required this.projects});

  int _getCrossAxisCount(double width) {
    if (width > 1200) return 4; // Desktop large
    if (width > 900) return 3; // Tablet landscape
    if (width > 600) return 2; // Tablet portrait
    return 1; // Mobile
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _getCrossAxisCount(width),
          childAspectRatio: 0.85, // adjust for nice card height
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ProjectCard(project: projects[index]);
        },
      ),
    );
  }
}
