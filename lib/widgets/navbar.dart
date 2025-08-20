import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/widgets/hover_drawer_item.dart';
import 'package:portfolio_web/widgets/hover_nav_item.dart';

class NavBar extends StatelessWidget {
  final Function(String) onNavItemTapped;

  const NavBar({super.key, required this.onNavItemTapped});

  final List<String> menuItems = const ["Home", "About", "Projects", "Contact"];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isDesktop = width > 900; // breakpoint

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "E", // First letter
                  style: GoogleFonts.bungeeShade(
                    fontSize: 30, // Bigger font size
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                TextSpan(
                  text: "BRAHIM", // Rest of the text
                  style: GoogleFonts.dancingScript(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Desktop Menu
          if (isDesktop)
            Row(
              children: menuItems.map((item) {
                return HoverNavItem(title: item, onTap: onNavItemTapped);
              }).toList(),
            )
          else
            // Mobile Menu Button
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
        ],
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black87,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimaryFixed,
            ),
            child: TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.work,
                size: 70,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              label: Text(
                'My Portfolio',
                style: GoogleFonts.dancingScript(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          ...menuItems.map((item) {
            return HoverDrawerItem(
              title: item,
              onTap: () {
                Navigator.pop(context); // close drawer
                onNavItemTapped(item);
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
