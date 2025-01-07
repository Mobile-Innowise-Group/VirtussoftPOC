import 'package:flutter/material.dart';

abstract class AppColors {
  factory AppColors.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? const LightColors()
        : const DarkColors();
  }

  Color get primaryBg;

  Color get primary;

  Color get secondary;

  Color get white;

  Color get textColor;

  Color get hintGray;

  Color get border;

  Color get lightBorder;

  Color get error;

  Color get transparent;

  Color get darkIcon;

  Color get textSecondary;

  Color get onSurface;

  Color get divider;

  Color get unSelectedIcon;
}

class DarkColors extends LightColors {
  const DarkColors();
}

class LightColors implements AppColors {
  const LightColors();

  @override
  Color get primaryBg => const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color get white => const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color get textColor => const Color.fromRGBO(0, 0, 0, 1);

  @override
  Color get hintGray => const Color(0xFF8F9098);

  @override
  Color get border => const Color.fromRGBO(113, 125, 126, 1);

  @override
  Color get primary => const Color.fromRGBO(59, 96, 106, 1);

  @override
  Color get error => const Color.fromRGBO(220, 47, 2, 1);

  @override
  Color get secondary => const Color.fromRGBO(248, 249, 254, 1);

  @override
  Color get transparent => const Color.fromRGBO(0, 0, 0, 0);

  @override
  Color get lightBorder => const Color(0xFFC5C6CC);

  @override
  Color get darkIcon => const Color(0xFF8F9098);

  @override
  Color get textSecondary => const Color.fromRGBO(113, 114, 122, 1);

  @override
  Color get onSurface => const Color.fromRGBO(31, 32, 36, 1);

  @override
  Color get divider => const Color.fromRGBO(197, 198, 204, 1);

  @override
  Color get unSelectedIcon => const Color.fromRGBO(212, 214, 221, 1);
}
