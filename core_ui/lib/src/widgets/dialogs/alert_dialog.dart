import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppAlertDialog extends StatelessWidget {
  final String title;
  final String text;
  final String optionYesText;
  final String optionNoText;
  final Function() optionYesCallback;
  final Function() optionNoCallback;

  const AppAlertDialog({
    required this.optionNoCallback,
    required this.optionYesCallback,
    this.title = 'Are you sure?',
    this.text = '',
    this.optionYesText = 'OK',
    this.optionNoText = 'Cancel',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);

    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(text),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: optionNoCallback,
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll<Color>(
              Colors.black.withOpacity(AppDimens.OPACITY_0_6),
            ),
            overlayColor: WidgetStatePropertyAll<Color>(colors.primaryBg),
          ),
          child: Text(optionNoText),
        ),
        TextButton(
          onPressed: optionYesCallback,
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll<Color>(colors.primary),
            overlayColor: WidgetStatePropertyAll<Color>(colors.primaryBg),
          ),
          child: Text(optionYesText),
        ),
      ],
    );
  }
}
