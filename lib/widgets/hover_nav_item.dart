import 'package:flutter/material.dart';

/// 🔥 New widget for hover effect
class HoverNavItem extends StatefulWidget {
  final String title;
  final Function(String) onTap;

  const HoverNavItem({super.key, required this.title, required this.onTap});

  @override
  State<HoverNavItem> createState() => _HoverNavItemState();
}

class _HoverNavItemState extends State<HoverNavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => widget.onTap(widget.title),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            fontSize: 16,
            color: _isHovered
                ? Theme.of(context).colorScheme.primary
                : Colors.white,
            fontWeight: _isHovered ? FontWeight.bold : FontWeight.normal,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}
