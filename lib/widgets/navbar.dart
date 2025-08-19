import 'package:flutter/material.dart';

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
      color: Colors.black87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          const Text(
            "My Portfolio",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          // Desktop Menu
          if (isDesktop)
            Row(
              children: menuItems.map((item) {
                return _navItem(context, item);
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

  Widget _navItem(BuildContext context, String title) {
    return InkWell(
      onTap: () {
        onNavItemTapped(title);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black87,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black54),
            child: Text(
              "My Portfolio",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          ...menuItems.map((item) {
            return ListTile(
              title: Text(item, style: const TextStyle(color: Colors.white)),
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
