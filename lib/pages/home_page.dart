import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Image
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(
              "assets/profile.jpg",
            ), // add your image in assets
          ),
          const SizedBox(height: 24),

          // Name
          const Text(
            "Ebrahim Ahmed",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          // Tagline
          const Text(
            "Flutter Developer",
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),

          const SizedBox(height: 32),

          // Call to Action Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade800,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              // For now, just show snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Scroll to Projects Section")),
              );
              // Later we’ll connect this to scroll → Projects
            },
            child: const Text(
              "See My Work",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
