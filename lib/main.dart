// lib/main.dart
import 'package:flutter/material.dart';
import 'package:portfolio_web/theme/app_background.dart';
import 'package:portfolio_web/theme/theme.dart';
import 'pages/home_page.dart';
import 'pages/projects_page.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'widgets/navbar.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  String _selectedPage = "Home";

  Widget _getPage(String page) {
    switch (page) {
      case "Projects":
        return const ProjectsPage();
      case "About":
        return const AboutPage();
      case "Contact":
        return const ContactPage();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final navBar = NavBar(
      onNavItemTapped: (page) {
        setState(() {
          _selectedPage = page;
        });
      },
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Portfolio - Ebrahim Ahmed",
      theme: theme,
      home: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            endDrawer: navBar.buildDrawer(context),
            body: Column(
              children: [
                navBar,
                Expanded(child: _getPage(_selectedPage)),
              ],
            ),
          );
        },
      ),
    );
  }
}
