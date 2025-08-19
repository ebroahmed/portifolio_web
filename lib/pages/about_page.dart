// lib/pages/about_page.dart
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "About Me",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            "Hi, I'm Ebrahim Ahmed 👋\n"
            "I'm a Flutter Developer with a passion for building modern, responsive mobile and web applications. "
            "I enjoy creating clean UIs, solving real-world problems, and delivering high-quality apps. "
            "Currently, I'm working on e-commerce apps, audio players, and hotel booking solutions.",
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 32),

          // Skills
          const Text(
            "Skills",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
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
              _skillChip("REST APIs"),
              _skillChip("Responsive UI"),
              _skillChip("Git & GitHub"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _skillChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blue.shade50,
      labelStyle: TextStyle(
        color: Colors.blue.shade800,
        fontWeight: FontWeight.w500,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }
}
