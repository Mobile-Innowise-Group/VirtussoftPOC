import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ReceiptDetailsItem extends StatelessWidget {
  final String label;
  final String value;

  const ReceiptDetailsItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: AppDimens.SIZE_24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Text(
              label,
              textAlign: TextAlign.start,
              style: AppFonts.headingH4,
            ),
          ),
          Flexible(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: AppFonts.bodyM,
            ),
          ),
        ],
      ),
    );
  }
}
