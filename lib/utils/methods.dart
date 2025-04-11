import 'dart:ui';

import 'colors.dart';

Color getRandomColor(int id) {
    return randomColors[id % randomColors.length];
  }

  String getPokemonId(String url) {
    final segments = url.split('/');
    return segments[segments.length - 2];
  }


  String formatPokemonName(String name) {
    return name.substring(0, 1).toUpperCase() + name.substring(1);
  }

  extension StringExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';
}