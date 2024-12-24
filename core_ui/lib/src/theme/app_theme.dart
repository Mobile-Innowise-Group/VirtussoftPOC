import 'package:flutter/material.dart';

import '../../core_ui.dart';

const LightColors _appColors = LightColors();

final ThemeData lightTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme().copyWith(color: _appColors.primaryBg),
  scaffoldBackgroundColor: _appColors.primaryBg,
  textTheme: _getTextTheme(),
  inputDecorationTheme: _getInputDecorationTheme(),
  primaryColor: _appColors.primary,
  buttonTheme: const ButtonThemeData().copyWith(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: _appColors.secondary,
      primary: _appColors.primary,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: _appColors.secondary,
    primary: _appColors.primary,
  ),
);

TextTheme _getTextTheme() {
  return TextTheme(
    titleMedium: AppFonts.normal13,
    bodyMedium: AppFonts.normal13,
  ).apply(
    bodyColor: _appColors.textColor,
    displayColor: _appColors.textColor,
  );
}

InputDecorationTheme _getInputDecorationTheme() {
  return InputDecorationTheme(
    hintStyle: AppFonts.normal13.copyWith(color: _appColors.hintGray),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(AppDimens.BORDER_RADIUS_12),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.BORDER_RADIUS_12),
      ),
      borderSide: BorderSide(
        color: _appColors.lightBorder,
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.BORDER_RADIUS_12),
      ),
      borderSide: BorderSide(
        color: _appColors.primary,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.BORDER_RADIUS_6),
      ),
      borderSide: BorderSide(
        color: _appColors.error,
        width: 2,
      ),
    ),
    labelStyle: AppFonts.normal13.copyWith(color: _appColors.hintGray),
  );
}
