import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class SettingsCategoryWidget extends StatelessWidget {
  final String title;
  final List<Widget> settings;

  const SettingsCategoryWidget({
    required this.title,
    required this.settings,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          title,
          style: textTheme.titleLarge,
        ),
        for (int i = 0; i < settings.length; i++) ...<Widget>[
          const SizedBox(height: AppDimens.PADDING_12),
          settings[i],
        ],
      ],
    );
  }
}
