// lib/pages/about_page.dart
import 'package:flutter/material.dart';
import 'package:portfolio_web/theme/app_background.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About Me",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Hello! 👋 I'm Ebrahim Ahmed \nA passionate Computer Science graduate (2025) from Jimma University, Ethiopia.\n"
                "I specialize in Flutter development, where I build modern mobile apps, web apps, \nand Flutter web solutions integrated with Firebase for powerful and scalable backends.\nOver the past 1.5 years, I’ve been sharpening my skills by working on multiple personal projects, \nwhich helped me gain practical, hands-on experience beyond the classroom. "
                "I love transforming ideas \ninto functional applications with clean UI, smooth user experiences, and efficient code. \nMy long-term goal is to keep growing as a software developer while contributing impactful \nprojects to the tech community.",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 32),

              // Skills
              Text(
                "Skills",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _skillChip("Flutter"),
                  _skillChip("Dart"),
                  _skillChip("Firebase"),
                  _skillChip("Provider / Riverpod"),
                  _skillChip("Flutter Web"),
                  _skillChip("Web App"),
                  _skillChip("Responsive UI"),
                  _skillChip("REST APIs"),
                  _skillChip("Git & GitHub"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _skillChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: Color.fromARGB(230, 3, 47, 83)),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }
}
