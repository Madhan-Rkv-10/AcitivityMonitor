import 'package:flutter/material.dart';

extension ThemeText on BuildContext {
  TextTheme get textThemes => Theme.of(this).textTheme;
}
