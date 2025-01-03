import 'package:flutter/material.dart';

import '../../core_ui.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;

  const ErrorScreen({
    this.errorMessage = 'Ooops!\nSomething went wrong!\nPlease try again',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const Icon(
            Icons.error_outline,
            size: AppDimens.SIZE_32,
          ),
          const SizedBox(
            height: AppDimens.PADDING_12,
          ),
          Text(errorMessage)
        ],
      ),
    );
  }
}
