import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AbstractTheme {
   AbstractTheme(
    this.activityBackgroundColor,
  );

  final Color activityBackgroundColor;
}
