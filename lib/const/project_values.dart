import 'package:flutter/material.dart';

///This class includes common static values for the project
class ProjectValues {
  ProjectValues._();

  ///Use on animation durations
  static Duration animateNormal = const Duration(milliseconds: 500);

  ///Use on box shapes
  static OutlinedBorder shapeNormal =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

  ///Use on box radius
  static BorderRadius radiusNormal = BorderRadius.circular(10);
}
