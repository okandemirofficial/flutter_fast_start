import 'package:flutter/material.dart';
import 'package:flutter_fast_start/core/theme/project_colors.dart';

///Static project theme class
class ProjectTheme {
  ProjectTheme._();

  ///to access light color theme
  static ThemeData lightColorTheme = ThemeData.light().copyWith(
    colorScheme: ProjectColors.lightColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: ProjectColors.lightColorScheme.primaryContainer,
    ),
    drawerTheme:
        const DrawerThemeData().copyWith(scrimColor: Colors.transparent),
  );
}
