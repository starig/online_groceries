import 'package:flutter/material.dart';
import 'package:online_groceries/config/theme/app_colors.dart';
import 'package:online_groceries/gen/fonts.gen.dart';

final lightTheme = ThemeData(fontFamily: FontFamily.gilroy, colorScheme: colorScheme);

final ColorScheme colorScheme = ColorScheme.light(
  brightness: Brightness.light,
  primary: AppColors.primaryColor,
  onPrimary: AppColors.onPrimary,
  secondary: AppColors.secondary,
  onSecondary: AppColors.onSecondary,
  error: Colors.red,
  onError: AppColors.onPrimary,
  surface: AppColors.surface,
  onSurface: AppColors.onSurface,
);

class FontStyles {
  static const double _labelSize = 24;
  static const double _textButtonSize = 16;
  static const double _titleSize = 16;
  static const double _subtitleSize = 14;

  static const TextStyle labelSemibold = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: _labelSize,
  );

  static const TextStyle textButtonSemibold = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: _textButtonSize,
  );

  static const TextStyle titleBold = TextStyle(fontWeight: FontWeight.w700, fontSize: _titleSize);
  static const TextStyle subtitleMedium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: _subtitleSize,
  );
}
