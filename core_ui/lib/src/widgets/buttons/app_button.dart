import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final IconData? maybeIcon = icon;
    final ColorScheme colors = Theme.of(context).colorScheme;

    return FilledButton.icon(
      onPressed: onPressed,
      label: Text(text),
      icon: maybeIcon != null ? Icon(maybeIcon, size: AppDimens.SIZE_24) : null,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(colors.primary),
        foregroundColor: WidgetStatePropertyAll<Color>(colors.onPrimary),
        textStyle: WidgetStatePropertyAll<TextStyle>(AppFonts.actionM),
        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(vertical: 12.0),
        ),
        shape: const WidgetStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
      ),
    );
  }
}
