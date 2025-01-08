import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class SettingsCategoryWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SettingsCategoryWidget({
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title, style: AppFonts.bodyM),
            Icon(
              Icons.arrow_forward_ios,
              size: 12,
              color: AppColors.of(context).hintGray,
            )
          ],
        ),
      ),
    );
  }
}
