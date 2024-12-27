import 'package:flutter/material.dart';

abstract class AppColors {
  factory AppColors.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? const LightColors() : const DarkColors();
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
}

class DarkColors extends LightColors {
  const DarkColors();
}

class LightColors implements AppColors {
  const LightColors();

  @override
  // RGBO(236, 239, 241, 1)
  Color get primaryBg => const Color.fromRGBO(238, 244, 237, 1);

  @override
  Color get white => const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color get textColor => const Color.fromRGBO(0, 0, 0, 1);

  @override
  Color get hintGray => const Color.fromRGBO(128, 128, 128, 1);

  @override
  Color get border => const Color.fromRGBO(113, 125, 126, 1);

  @override
  Color get primary => const Color.fromRGBO(0, 48, 73, 1);

  @override
  Color get error => const Color.fromRGBO(220, 47, 2, 1);

  @override
  Color get secondary => const Color.fromRGBO(102, 155, 188, 1);

  @override
  Color get transparent => const Color.fromRGBO(0, 0, 0, 0);

  @override
  Color get lightBorder => const Color.fromRGBO(190, 207, 217, 1);
}
