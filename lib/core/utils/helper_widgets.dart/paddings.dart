import 'package:flutter/material.dart';

///Useful for setting some standart. Use this when you add padding
class ProjectPaddings {
  ///8px
  static const double small = 8;

  ///16px
  static const double medium = 16;

  ///32px
  static const double large = 32;

  ///64px
  static const double xlarge = 64;
}

///Easy padding top widget
///PaddingTop.m (16) or PaddingTop.s (8)
class PaddingTop extends Padding {
  ///Gives 16px top padding
  const PaddingTop.m({
    super.key,
    required Widget super.child,
    super.padding = const EdgeInsets.only(top: ProjectPaddings.medium),
  });

  ///Gives 8px top padding
  const PaddingTop.s({
    super.key,
    required Widget super.child,
    super.padding = const EdgeInsets.only(top: ProjectPaddings.small),
  });
}

///Easy padding bottom widget
///PaddingBottom.m (16) or PaddingBottom.s (8)
class PaddingBottom extends Padding {
  ///Gives 16px bottom padding
  const PaddingBottom.m({
    super.key,
    required Widget super.child,
    super.padding = const EdgeInsets.only(bottom: ProjectPaddings.medium),
  });

  ///Gives 8px bottom padding
  const PaddingBottom.s({
    super.key,
    required Widget super.child,
    super.padding = const EdgeInsets.only(bottom: ProjectPaddings.small),
  });
}

///Easy padding right widget
///PaddingRight.m (16) or PaddingRight.s (8)
class PaddingRight extends Padding {
  ///Gives 16px right padding
  const PaddingRight.m({
    super.key,
    required Widget super.child,
    super.padding = const EdgeInsets.only(right: ProjectPaddings.medium),
  });

  ///Gives 8px right padding
  const PaddingRight.s({
    super.key,
    required Widget super.child,
    super.padding = const EdgeInsets.only(right: ProjectPaddings.small),
  });
}

///Gives left and right padding
///PaddingHorizontal.l (32) PaddingHorizontal.m(16) PaddingHorizontal.s (8)
class PaddingHorizontal extends Padding {
  ///Left and right 32px
  const PaddingHorizontal.l({
    super.key,
    required Widget super.child,
    super.padding = const EdgeInsets.symmetric(
      horizontal: ProjectPaddings.large,
    ),
  });

  ///Left and right 16px
  const PaddingHorizontal.m({
    super.key,
    required Widget super.child,
    super.padding = const EdgeInsets.symmetric(
      horizontal: ProjectPaddings.medium,
    ),
  });

  ///Left and right 8px
  const PaddingHorizontal.s({
    super.key,
    required Widget super.child,
    super.padding = const EdgeInsets.symmetric(
      horizontal: ProjectPaddings.small,
    ),
  });
}

///Gives top and bottom padding
///PaddingVertical.l (32) PaddingVertical.m (16) PaddingVertical.s (8)
class PaddingVertical extends Padding {
  ///Top and bottom 32px
  const PaddingVertical.l({
    super.key,
    required Widget super.child,
    super.padding = const EdgeInsets.symmetric(
      vertical: ProjectPaddings.large,
    ),
  });

  ///Top and bottom 16px
  const PaddingVertical.m({
    super.key,
    required Widget super.child,
    super.padding = const EdgeInsets.symmetric(
      vertical: ProjectPaddings.medium,
    ),
  });

  ///Top and bottom 8px
  const PaddingVertical.s({
    super.key,
    required Widget super.child,
    super.padding = const EdgeInsets.symmetric(
      vertical: ProjectPaddings.small,
    ),
  });
}

///Gives top and left padding
///PaddingTopLeft.m (16) PaddingTopLeft.s (8)
class PaddingTopLeft extends Padding {
  ///Top and left 16px
  const PaddingTopLeft.m({
    super.key,
    required Widget super.child,
    super.padding = const EdgeInsets.only(
      top: ProjectPaddings.medium,
      left: ProjectPaddings.medium,
    ),
  });

  ///Top and left 8px
  const PaddingTopLeft.s({
    super.key,
    required Widget super.child,
    super.padding = const EdgeInsets.only(
      top: ProjectPaddings.small,
      left: ProjectPaddings.small,
    ),
  });
}

///Padding all sides
///PaddingAll.m (16) PaddingAll.s (8)
class PaddingAll extends Padding {
  ///All sides 16px
  const PaddingAll.m({
    super.key,
    required Widget super.child,
    super.padding = const EdgeInsets.all(ProjectPaddings.medium),
  });

  ///All sides 8px
  const PaddingAll.s({
    super.key,
    required Widget super.child,
    super.padding = const EdgeInsets.all(ProjectPaddings.small),
  });
}

///It gives spaces every child of list
///Also has a padding propery
///ListViewWithSpacing.m (16px) ListViewWithSpacing.s (8px)
class ListViewWithSpacing extends StatelessWidget {
  ///16 px padding between each children
  ListViewWithSpacing.m({
    super.key,
    required this.children,
    this.padding,
    this.controller,
    this.scrollDirection = Axis.vertical,
  }) {
    if (scrollDirection == Axis.vertical) {
      _itemPadding = const EdgeInsets.only(bottom: ProjectPaddings.medium);
    } else {
      _itemPadding = const EdgeInsets.only(right: ProjectPaddings.medium);
    }
  }

  ///8 px padding between each children
  ListViewWithSpacing.s({
    super.key,
    required this.children,
    this.padding,
    this.controller,
    this.scrollDirection = Axis.vertical,
  }) {
    if (scrollDirection == Axis.vertical) {
      _itemPadding = const EdgeInsets.only(bottom: ProjectPaddings.small);
    } else {
      _itemPadding = const EdgeInsets.only(right: ProjectPaddings.small);
    }
  }

  ///Each children will be spaced
  final List<Widget> children;

  ///Scroll controller
  final ScrollController? controller;

  ///Axis.horizontal or Axis.vertical
  final Axis scrollDirection;

  ///To give custom
  late final EdgeInsets _itemPadding;

  ///To give listView padding (default 8px all)
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: scrollDirection,
      controller: controller,
      padding: padding ?? const EdgeInsets.all(ProjectPaddings.small),
      children: children
          .map((e) => Padding(padding: _itemPadding, child: e))
          .toList(),
    );
  }
}

///It gives spaces every child of column
///Also has a padding propery
///ColumnWithSpacing.m 16(px) ColumnWithSpacing.s (8px)
class ColumnWithSpacing extends StatelessWidget {
  ///16 px padding between each children
  ColumnWithSpacing.m({
    super.key,
    required this.children,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.mainAxisSize,
  }) {
    _padding = const EdgeInsets.only(bottom: ProjectPaddings.small);
  }

  ///8 px padding between each children
  ColumnWithSpacing.s({
    super.key,
    required this.children,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.mainAxisSize,
  }) {
    _padding = const EdgeInsets.only(bottom: ProjectPaddings.small);
  }

  ///Each children will be spaced
  final List<Widget> children;

  ///MainAxisAlignment
  final MainAxisAlignment? mainAxisAlignment;

  ///CrossAxisAlignment
  final CrossAxisAlignment? crossAxisAlignment;

  ///MainAxisSize
  final MainAxisSize? mainAxisSize;

  late final EdgeInsets _padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainAxisSize ?? MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children:
          children.map((e) => Padding(padding: _padding, child: e)).toList(),
    );
  }
}

///It gives spaces every child of row
///Also has a padding propery
///RowWithSpacing.m 16(px) RowWithSpacing.s (8px)
class RowWithSpacing extends StatelessWidget {
  ///16 px padding between each children
  RowWithSpacing.m({
    super.key,
    required this.children,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisSize,
  }) {
    _padding = const EdgeInsets.only(bottom: ProjectPaddings.medium);
  }

  ///8 px padding between each children
  RowWithSpacing.s({
    super.key,
    required this.children,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisSize,
  }) {
    _padding = const EdgeInsets.only(bottom: ProjectPaddings.small);
  }

  ///Each children will be spaced
  final List<Widget> children;

  ///MainAxisAlignment
  final MainAxisAlignment? mainAxisAlignment;

  ///CrossAxisAlignment
  final CrossAxisAlignment? crossAxisAlignment;

  ///MainAxisSize
  final MainAxisSize? mainAxisSize;

  late final EdgeInsets _padding;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children:
          children.map((e) => Padding(padding: _padding, child: e)).toList(),
    );
  }
}

///Every Expanded spacing objects should wrap with this widget
class FlexWidget {
  ///Every Expanded spacing objects should wrap with this widget
  FlexWidget({this.flex, required this.child});

  ///flex
  final int? flex;

  ///child
  final Widget child;
}

///It's a widget with a rule: Every child should be expanded with flex property
///Default flex value is 1
class RowWithExpandedSpacing extends StatelessWidget {
  ///Expanded with flex (default 1) and padding 8px
  RowWithExpandedSpacing.s({
    super.key,
    required this.childrenWithFlex,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
  }) {
    _padding = const EdgeInsets.only(bottom: ProjectPaddings.small);
  }

  ///Expanded with flex (default 1) and padding 16px
  RowWithExpandedSpacing.m({
    super.key,
    required this.childrenWithFlex,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
  }) {
    _padding = const EdgeInsets.only(bottom: ProjectPaddings.small);
  }

  ///MainAxisAlignment
  final MainAxisAlignment? mainAxisAlignment;

  /// list object that consist of FlexWidget
  final List<FlexWidget> childrenWithFlex;

  ///CrossAxisAlignment
  final CrossAxisAlignment? crossAxisAlignment;
  late final EdgeInsets _padding;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: childrenWithFlex
          .map(
            (e) => Expanded(
              flex: e.flex ?? 1,
              child: Padding(padding: _padding, child: e.child),
            ),
          )
          .toList(),
    );
  }
}
