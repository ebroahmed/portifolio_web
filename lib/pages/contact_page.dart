import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  style: GoogleFonts.quicksand(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Email
                Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () =>
                          _launchURL("mailto:ebrahimahmed804853@gmail.com"),
                      icon: const Icon(Icons.email, size: 25),
                      label: const Text("Email Me"),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () => _launchURL(
                        "https://mail.google.com/mail/?view=cm&fs=1&to=ebrahimahmed804853@gmail.com",
                      ),
                      icon: const Icon(Icons.email_outlined, size: 25),
                      label: const Text("Email via Gmail"),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // GitHub
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: Icon(Bootstrap.github, size: 25, color: Colors.black),
                  onPressed: () => _launchURL("https://github.com/ebroahmed"),
                  label: Text(
                    "Github",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Theme.of(
                        context,
                      ).colorScheme.onPrimaryFixedVariant,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // LinkedIn
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: Icon(Bootstrap.linkedin, size: 25, color: Colors.blue),
                  onPressed: () => _launchURL(
                    "https://www.linkedin.com/in/ebrahim-ahmed-92bba637b?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
                  ),
                  label: Text(
                    "Linkedin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Theme.of(
                        context,
                      ).colorScheme.onPrimaryFixedVariant,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // YouTube
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: Icon(Bootstrap.youtube, size: 25, color: Colors.red),
                  onPressed: () => _launchURL(
                    "https://youtube.com/@flutterhacks-eb02?si=FAHl6cfAdkPdsOhc",
                  ),
                  label: Text(
                    "Youtube",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(
                        context,
                      ).colorScheme.onPrimaryFixedVariant,
                    ),
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
