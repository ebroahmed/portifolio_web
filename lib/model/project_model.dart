// lib/models/project.dart
class Project {
  final String title;
  final String description;
  final List<String> images; // multiple screenshots
  final String? githubUrl;
  final String? youtubeUrl;
  final String? releaseUrl;

  const Project({
    required this.title,
    required this.description,
    required this.images,
    this.githubUrl,
    this.youtubeUrl,
    this.releaseUrl,
  });
}
