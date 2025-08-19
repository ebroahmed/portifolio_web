import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  // Functions to launch URLs
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact Me"), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Let’s Connect!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Email
              ElevatedButton.icon(
                onPressed: () => _launchURL("mailto:your_email@example.com"),
                icon: const Icon(Icons.email),
                label: const Text("Email Me"),
              ),
              const SizedBox(height: 20),

              // GitHub
              IconButton(
                icon: Icon(Bootstrap.github, size: 30, color: Colors.black),
                onPressed: () => _launchURL("https://github.com/your-username"),
              ),
              SizedBox(height: 10),

              // LinkedIn
              IconButton(
                icon: Icon(Bootstrap.linkedin, size: 30, color: Colors.blue),
                onPressed: () =>
                    _launchURL("https://linkedin.com/in/your-profile"),
              ),
              SizedBox(height: 10),

              // YouTube
              IconButton(
                icon: Icon(Bootstrap.youtube, size: 40, color: Colors.red),
                onPressed: () => _launchURL("https://youtube.com/@yourchannel"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
