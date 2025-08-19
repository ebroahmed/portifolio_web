// lib/widgets/project_card.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:portfolio_web/model/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Carousel slider for screenshots
          AspectRatio(
            aspectRatio: 16 / 9,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                enableInfiniteScroll: true,
              ),
              items: project.images.map((img) {
                final isNetwork = img.startsWith("http");
                return isNetwork
                    ? Image.network(img, fit: BoxFit.cover)
                    : Image.asset(img, fit: BoxFit.cover);
              }).toList(),
            ),
          ),

          // Title + description
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              project.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Text(
              project.description,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),

          const Spacer(),

          // Buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Wrap(
              spacing: 12,
              children: [
                if (project.githubUrl != null)
                  _linkButton(Icons.code, "GitHub", project.githubUrl!),
                if (project.youtubeUrl != null)
                  _linkButton(
                    Icons.ondemand_video,
                    "YouTube",
                    project.youtubeUrl!,
                  ),
                if (project.releaseUrl != null)
                  _linkButton(
                    Icons.open_in_new,
                    "Release",
                    project.releaseUrl!,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _linkButton(IconData icon, String label, String url) {
    return OutlinedButton.icon(
      onPressed: () async {
        final uri = Uri.parse(url);
        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
          throw 'Could not launch $url';
        }
      },
      icon: Icon(icon, size: 18),
      label: Text(label),
    );
  }
}
