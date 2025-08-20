import 'package:flutter/material.dart';
import 'package:portfolio_web/pages/projects_page.dart';
import 'package:portfolio_web/theme/app_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth = constraints.maxWidth;

            // Define breakpoints
            bool isMobile = maxWidth < 600;
            bool isTablet = maxWidth >= 600 && maxWidth < 1024;

            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 32,
                vertical: isMobile ? 32 : 64,
              ),
              child: Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Image
                  CircleAvatar(
                    radius: isMobile
                        ? 80
                        : isTablet
                        ? 150
                        : 200,
                    backgroundImage: AssetImage(
                      "assets/images/portfolio-profile.png",
                    ),
                  ),

                  SizedBox(width: isMobile ? 0 : 60, height: isMobile ? 24 : 0),

                  // Texts + Button
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: isMobile
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        "I'm Ebrahim Ahmed \nA Flutter Developer.",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: isMobile
                              ? 24
                              : isTablet
                              ? 32
                              : 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "A Flutter Developer with a passion for building\nmodern, responsive mobile and web applications.",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimaryFixed,
                          fontSize: isMobile
                              ? 16
                              : isTablet
                              ? 18
                              : 20,
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => ProjectsPage()),
                          );
                        },
                        child: Text(
                          "See My Work",
                          style: TextStyle(
                            fontSize: isMobile ? 16 : 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
