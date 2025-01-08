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
      title: Text(title, style: AppFonts.headingH3),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              text,
              style: AppFonts.bodyM,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: optionNoCallback,
          child: Text(optionNoText),
        ),
        TextButton(
          onPressed: optionYesCallback,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(colors.primary),
          ),
          child: Text(
            optionYesText,
            style: AppFonts.bodyM.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
