import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pokemon/utils/colors.dart';
import 'package:pokemon/utils/methods.dart';

class AbilityTile extends StatelessWidget {
  final String abilityName;
  final Color primaryColor;
  final int index;

  const AbilityTile({
    Key? key,
    required this.abilityName,
    required this.primaryColor,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: buildsectionColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: disabledcolor.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: primaryColor.withOpacity(0.2),
          child: Text(
            "${index + 1}",
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          abilityName.replaceAll("-", " ").toCapitalized(),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
