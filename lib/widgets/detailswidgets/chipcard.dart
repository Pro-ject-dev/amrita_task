import 'package:flutter/material.dart';
import 'package:pokemon/utils/colors.dart';

class Cards{
static ChipCard(BuildContext context, String label, String value,
      IconData icon, Color color) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: buildsectionColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: disabledcolor.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

}