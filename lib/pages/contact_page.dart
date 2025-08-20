import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio_web/theme/app_background.dart';

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
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Contact Me",
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You can contact me on the following platforms.",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Email
                ElevatedButton.icon(
                  onPressed: () => _launchURL("ebrahimahmed804853@gmail.com"),
                  icon: const Icon(Icons.email),
                  label: const Text("Email Me"),
                ),
                const SizedBox(height: 20),

                // GitHub
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  icon: Icon(Bootstrap.github, size: 28, color: Colors.black),
                  onPressed: () => _launchURL("https://github.com/ebroahmed/"),
                  label: const Text(
                    "Github",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 10),

                // LinkedIn
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  icon: Icon(Bootstrap.linkedin, size: 28, color: Colors.blue),
                  onPressed: () =>
                      _launchURL("https://linkedin.com/in/your-profile"),
                  label: const Text(
                    "Linkedin",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 10),

                // YouTube
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  icon: Icon(Bootstrap.youtube, size: 28, color: Colors.red),
                  onPressed: () => _launchURL(
                    "https://youtube.com/@flutterhacks-eb02?si=FAHl6cfAdkPdsOhc",
                  ),
                  label: const Text(
                    "Youtube",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
