import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core_ui.dart';

const LightColors _appColors = LightColors();

final ThemeData lightTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme().copyWith(color: _appColors.primaryBg),
  scaffoldBackgroundColor: _appColors.primaryBg,
  textTheme: _getTextTheme(),
  inputDecorationTheme: _getInputDecorationTheme(),
  primaryColor: _appColors.primary,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: WidgetStateProperty.all<Size>(const Size.fromHeight(48)),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      textStyle: WidgetStateProperty.all<TextStyle>(
        AppFonts.actionM.copyWith(color: _appColors.white),
      ),
      minimumSize: WidgetStateProperty.all<Size>(const Size.fromHeight(48)),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: _appColors.secondary,
    surface: _appColors.white,
    primary: _appColors.primary,
  ),
);

TextTheme _getTextTheme() {
  return const TextTheme().apply(
    bodyColor: _appColors.textColor,
    displayColor: _appColors.textColor,
  );
}

InputDecorationTheme _getInputDecorationTheme() {
  return InputDecorationTheme(
    hintStyle: AppFonts.bodyM.copyWith(color: _appColors.hintGray),
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
        Radius.circular(AppDimens.BORDER_RADIUS_12),
      ),
      borderSide: BorderSide(
        color: _appColors.error,
        width: 2,
      ),
    ),
  );
}
