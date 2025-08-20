import 'package:flutter/material.dart';

class HoverDrawerItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const HoverDrawerItem({super.key, required this.title, required this.onTap});

  @override
  State<HoverDrawerItem> createState() => _HoverDrawerItemState();
}

class _HoverDrawerItemState extends State<HoverDrawerItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: ListTile(
        tileColor: _isHovered
            ? Colors.white10
            : Colors.transparent, // subtle bg highlight
        title: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            color: _isHovered
                ? Theme.of(context).colorScheme.primary
                : Colors.white,
            fontWeight: _isHovered ? FontWeight.bold : FontWeight.normal,
          ),
          child: Text(widget.title),
        ),
        onTap: widget.onTap,
      ),
    );
  }
}
