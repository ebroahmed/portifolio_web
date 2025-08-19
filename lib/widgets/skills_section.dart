// lib/widgets/skills_section.dart
import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  final List<Map<String, dynamic>> skills;

  const SkillsSection({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      runSpacing: 20,
      children: skills.map((skill) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(skill['icon'], size: 40, color: Colors.blueAccent),
            const SizedBox(height: 8),
            Text(
              skill['name'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        );
      }).toList(),
    );
  }
}
