import 'package:flutter/material.dart';

///Changes all text colors, divider color and icon color
///
///IT'S MANDATORY TO USE CHILD WIDGET AS A BUILDER OR EXTRACTING A NEW WIDGET
class ApplyColor extends StatelessWidget {
  ///Changes all text colors, divider color and icon color
  const ApplyColor({super.key, required this.color, required this.child});

  ///Color
  final Color color;

  ///Widget
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: color,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: color),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: color,
              displayColor: color,
            ),
      ),
      child: DefaultTextStyle(
        style: TextStyle(color: color),
        child: child,
      ),
    );
  }
}
