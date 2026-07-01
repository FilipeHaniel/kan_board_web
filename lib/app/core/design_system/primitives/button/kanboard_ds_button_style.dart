import 'package:flutter/material.dart';

class KanBoardDSButtonStyle {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;

  final double borderWidth;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final TextStyle textStyle;
  final List<BoxShadow> boxShadows;
  final double height;

  const KanBoardDSButtonStyle({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
    required this.borderWidth,
    required this.borderRadius,
    required this.padding,
    required this.textStyle,
    required this.boxShadows,
    required this.height,
  });
}
