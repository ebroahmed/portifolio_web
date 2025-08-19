// lib/models/project.dart
class Project {
  final String title;
  final String description;

  /// Can be a network URL ("https://...") or an asset path ("assets/...").
  final String image;
  final String? githubUrl;
  final String? youtubeUrl;
  final String? releaseUrl;

  const Project({
    required this.title,
    required this.description,
    required this.image,
    this.githubUrl,
    this.youtubeUrl,
    this.releaseUrl,
  });

  bool get isNetworkImage =>
      image.startsWith('http://') || image.startsWith('https://');
}
