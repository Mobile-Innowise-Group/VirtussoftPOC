import 'package:flutter/material.dart';

import 'setting_row_widget.dart';
import 'settings_category_widget.dart';

class AccountSettingsWidget extends StatelessWidget {
  const AccountSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsCategoryWidget(
      title: 'Settings',
      settings: <Widget>[
        SettingRowWidget(
          text: 'Edit email',
          onTap: () {},
        ),
        SettingRowWidget(
          text: 'Edit username',
          onTap: () {},
        ),
        SettingRowWidget(
          text: 'Delete profile',
          onTap: () {},
        ),
      ],
    );
  }
}
