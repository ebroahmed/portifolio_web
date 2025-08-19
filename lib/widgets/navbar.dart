import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final Function(String) onNavItemTapped;

  const NavBar({super.key, required this.onNavItemTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo or Name
          Text(
            "Ebrahim Ahmed",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
            ),
          ),

          // Nav items
          Row(
            children: [
              _navItem("Home"),
              const SizedBox(width: 24),
              _navItem("Projects"),
              const SizedBox(width: 24),
              _navItem("About"),
              const SizedBox(width: 24),
              _navItem("Contact"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navItem(String title) {
    return InkWell(
      onTap: () => onNavItemTapped(title),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }
}
