import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AbstractTheme {
  AbstractTheme(
    this.backgroundColor,
    this.infoTextColor,
    this.inactiveTextColor,
    this.cardColor,
    this.wrongColor,
    this.rightColor,
  );

  final Color backgroundColor;
  final Color infoTextColor;
  final Color inactiveTextColor;
  final Color cardColor;
  final Color wrongColor;
  final Color rightColor;
}
