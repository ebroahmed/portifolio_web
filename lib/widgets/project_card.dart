import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:portfolio_web/model/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;

        bool isMobile = maxWidth < 600;
        bool isTablet = maxWidth >= 600 && maxWidth < 1024;
        bool isDesktop = maxWidth >= 1024;

        return SizedBox(
          height: 800,
          width: 600,
          child: Card(
            color: Theme.of(context).colorScheme.secondaryFixedDim,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Carousel side
                        Expanded(
                          flex: 2,
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: _buildCarousel(context),
                          ),
                        ),
                        const SizedBox(width: 24),

                        // Content side - now scrollable to prevent overflow
                        Expanded(
                          flex: 3,
                          child: SingleChildScrollView(
                            child: _buildContent(
                              context,
                              isMobile,
                              isTablet,
                              isDesktop,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: _buildCarousel(context),
                        ),
                        const SizedBox(height: 16),
                        // Wrap content in Flexible scrollable
                        Flexible(
                          child: SingleChildScrollView(
                            child: _buildContent(
                              context,
                              isMobile,
                              isTablet,
                              isDesktop,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }

  /// carousel builder
  Widget _buildCarousel(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
        enableInfiniteScroll: true,
      ),
      itemCount: project.images.length,
      itemBuilder: (context, index, realIndex) {
        final img = project.images[index];
        final isNetwork = img.startsWith("http");

        return GestureDetector(
          onTap: () {
            _openImageViewer(context, index);
          },
          child: isNetwork
              ? Image.network(img, fit: BoxFit.contain, width: double.infinity)
              : Image.asset(img, fit: BoxFit.contain, width: double.infinity),
        );
      },
    );
  }

  /// full-screen image viewer with arrows + indicator
  void _openImageViewer(BuildContext context, int initialIndex) {
    showDialog(
      context: context,
      builder: (context) {
        PageController controller = PageController(initialPage: initialIndex);
        int currentIndex = initialIndex;

        return StatefulBuilder(
          builder: (context, setState) {
            void goTo(int index) {
              if (index >= 0 && index < project.images.length) {
                controller.jumpToPage(index);
                setState(() => currentIndex = index);
              }
            }

            return Dialog(
              backgroundColor: Colors.black,
              insetPadding: EdgeInsets.zero,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView.builder(
                    controller: controller,
                    itemCount: project.images.length,
                    onPageChanged: (index) {
                      setState(() => currentIndex = index);
                    },
                    itemBuilder: (context, index) {
                      final img = project.images[index];
                      final isNetwork = img.startsWith("http");

                      return InteractiveViewer(
                        child: isNetwork
                            ? Image.network(img, fit: BoxFit.contain)
                            : Image.asset(img, fit: BoxFit.contain),
                      );
                    },
                  ),

                  // Close button
                  Positioned(
                    top: 30,
                    right: 20,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),

                  // Left arrow
                  Positioned(
                    left: 20,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: currentIndex > 0
                          ? () => goTo(currentIndex - 1)
                          : null,
                    ),
                  ),

                  // Right arrow
                  Positioned(
                    right: 20,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: currentIndex < project.images.length - 1
                          ? () => goTo(currentIndex + 1)
                          : null,
                    ),
                  ),

                  // Indicator (dots + counter)
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Column(
                      children: [
                        Text(
                          "${currentIndex + 1} / ${project.images.length}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            project.images.length,
                            (index) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: currentIndex == index ? 12 : 8,
                              height: currentIndex == index ? 12 : 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == index
                                    ? Colors.white
                                    : Colors.white54,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  /// content builder
  Widget _buildContent(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    bool isDesktop,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryFixed,
            fontSize: isMobile
                ? 16
                : isTablet
                ? 18
                : 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          project.description,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondaryFixedVariant,
            fontSize: isMobile ? 13 : 14,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            if (project.githubUrl != null)
              _linkButton(
                Icons.code,
                "See the code on GitHub",
                project.githubUrl!,
              ),
            if (project.youtubeUrl != null)
              _linkButton(
                Icons.ondemand_video,
                "Watch the video on YouTube",
                project.youtubeUrl!,
              ),
            if (project.releaseUrl != null)
              _linkButton(
                Icons.download,
                "Download the app",
                project.releaseUrl!,
              ),
          ],
        ),
      ],
    );
  }

  /// button builder
  Widget _linkButton(IconData icon, String label, String url) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        foregroundColor: Color.fromARGB(230, 1, 25, 44),
        backgroundColor: Colors.white,
      ),
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
