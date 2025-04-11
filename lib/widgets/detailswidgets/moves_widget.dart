import 'package:flutter/material.dart';
import 'package:pokemon/utils/colors.dart';
import 'package:pokemon/utils/methods.dart';

class MoveTile extends StatelessWidget {
  final String moveName;
  final Color primaryColor;

  const MoveTile({
    Key? key,
    required this.moveName,
    required this.primaryColor,
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
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child:Icon(Icons.accessibility_outlined,
            color: primaryColor,
            size: 24,
          ),
          
          
        ),
        title: Text(
          moveName.replaceAll("-", " ").toCapitalized(),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        trailing: Icon(
          Icons.info_outline,
          color: disabledcolor.shade400,
        ),
      ),
    );
  }
}
