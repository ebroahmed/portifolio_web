import 'package:flutter/material.dart';
import 'package:portfolio_web/model/project_model.dart';
import 'package:portfolio_web/theme/app_background.dart';
import 'package:portfolio_web/widgets/projects_grid.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      Project(
        title: "Ecommerce Flutter App",
        description:
            "A cool user friendly e-commerce app using flutter for UI and firebase for backend.",
        images: [
          "assets/screenshots/ecommerce/login.jpg",
          "assets/screenshots/ecommerce/signup.jpg",
          "assets/screenshots/ecommerce/home.jpg",
          "assets/screenshots/ecommerce/detail.jpg",
          "assets/screenshots/ecommerce/cart.jpg",
          "assets/screenshots/ecommerce/checkout.jpg",
          "assets/screenshots/ecommerce/sidebar.jpg",
          "assets/screenshots/ecommerce/profile.jpg",
          "assets/screenshots/ecommerce/wishlist.jpg",
          "assets/screenshots/ecommerce/admin.jpg",
        ],
        githubUrl: "https://github.com/ebroahmed/e_commerce_flutter_app",
        youtubeUrl: "https://youtu.be/vvNhUYWzvBk?si=yM-BFU92FDrdmf9h",
        releaseUrl:
            "https://github.com/ebroahmed/e_commerce_flutter_app/releases/download/v1.0.0%2B1/ecommerce-flutter-app.apk",
      ),
      Project(
        title: "Audio player App",
        description:
            "A a modern audio player app with a lot of features using flutter for UI , flutter riverpod for state management and also firebase and cloudinary for backend.",
        images: [
          "assets/screenshots/audio-player/home.jpg",
          "assets/screenshots/audio-player/player.jpg",
          "assets/screenshots/audio-player/login.jpg",
          "assets/screenshots/audio-player/signup.jpg",
          "assets/screenshots/audio-player/upload.jpg",
          "assets/screenshots/audio-player/profile.jpg",
        ],
        githubUrl: "https://github.com/ebroahmed/audio_player_app",
        youtubeUrl: "https://youtu.be/UBdXx22nnt0?si=0vsOF06ji1xwXMWv",
        releaseUrl:
            "https://github.com/ebroahmed/audio_player_app/releases/download/v1.0.0/audio_player_app.apk",
      ),
      Project(
        title: "Quiz App",
        description:
            "This is a user friendly quiz app with best features using flutter for UI , flutter riverpod for state management and also firebase for backend",
        images: [
          "assets/screenshots/quiz/login.jpg",
          "assets/screenshots/quiz/signup.jpg",
          "assets/screenshots/quiz/home.jpg",
          "assets/screenshots/quiz/quiz.jpg",
          "assets/screenshots/quiz/result.jpg",
          "assets/screenshots/quiz/profile.jpg",
          "assets/screenshots/quiz/history.jpg",
        ],
        githubUrl: "https://github.com/ebroahmed/quiz_app",
        youtubeUrl: "https://youtu.be/f12kHED0Lx4?si=5WROUnR3Q789WyCC",
        releaseUrl:
            "https://github.com/ebroahmed/quiz_app/releases/download/v1.0.0%2B1/quiz_app.apk",
      ),

      // add more Project objects here
    ];

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          backgroundColor: Colors.transparent,
          title: Text(
            "Projects",
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProjectGrid(projects: projects),
        ),
      ),
    );
  }
}
