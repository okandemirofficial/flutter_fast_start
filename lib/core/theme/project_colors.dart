import 'package:flutter/material.dart';

///Contains project colors for both light and dark theme
class ProjectColors {
  ProjectColors._();

  ///light color scheme
  static ColorScheme lightColorScheme = const ColorScheme.light().copyWith(
    primary: const Color.fromARGB(255, 255, 4, 0),
    secondary: const Color.fromARGB(255, 68, 81, 116),
    onSecondary: const Color.fromARGB(255, 216, 221, 232),
    tertiary: const Color.fromARGB(255, 204, 209, 224),
    //space cadet
    //secondary: const Color.fromARGB(255, 33, 39, 56),
    primaryContainer: Colors.black87,
    onPrimary: const Color.fromARGB(255, 255, 255, 255),
    onSurfaceVariant: Colors.black45,
  );
}
