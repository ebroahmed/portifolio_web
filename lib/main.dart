// lib/main.dart
import 'package:flutter/material.dart';
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
        return ProjectsPage();
      case "About":
        return AboutPage();
      case "Contact":
        return ContactPage();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Portfolio - Ebrahim Ahmed",
      home: Scaffold(
        body: Column(
          children: [
            NavBar(
              onNavItemTapped: (page) {
                setState(() {
                  _selectedPage = page;
                });
              },
            ),
            Expanded(child: _getPage(_selectedPage)),
          ],
        ),
      ),
    );
  }
}
