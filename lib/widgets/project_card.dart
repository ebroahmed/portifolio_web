// lib/widgets/project_card.dart
import 'package:flutter/material.dart';
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
          // Image
          AspectRatio(
            aspectRatio: 16 / 9,
            child: project.isNetworkImage
                ? Image.network(
                    project.image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        _ImageFallback(title: project.title),
                  )
                : Image.asset(project.image, fit: BoxFit.cover),
          ),

          // Text content
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

          // Action buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                if (project.githubUrl != null)
                  _LinkButton(
                    icon: Icons.code,
                    label: 'GitHub',
                    url: project.githubUrl!,
                  ),
                if (project.youtubeUrl != null)
                  _LinkButton(
                    icon: Icons.ondemand_video,
                    label: 'YouTube',
                    url: project.youtubeUrl!,
                  ),
                if (project.releaseUrl != null)
                  _LinkButton(
                    icon: Icons.open_in_new,
                    label: 'Release',
                    url: project.releaseUrl!,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LinkButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;
  const _LinkButton({
    required this.icon,
    required this.label,
    required this.url,
  });

  Future<void> _launch(String link) async {
    final uri = Uri.parse(link);
    if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
      // ignore: use_build_context_synchronously
      throw 'Could not launch $link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => _launch(url),
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class _ImageFallback extends StatelessWidget {
  final String title;
  const _ImageFallback({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
