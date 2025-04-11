import 'package:flutter/material.dart';
import 'package:pokemon/utils/colors.dart';
import 'package:pokemon/utils/methods.dart';

class TypeChip extends StatelessWidget {
  final String typeName;

  const TypeChip({
    Key? key,
    required this.typeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(
          color: buildsectionColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        typeName.toCapitalized(),
        style:  TextStyle(
          color: buildsectionColor,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}

