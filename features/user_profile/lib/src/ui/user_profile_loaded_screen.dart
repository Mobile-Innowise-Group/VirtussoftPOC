import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'widgets/account_settings_widget.dart';
import 'widgets/user_name_widget.dart';

class UserProfileLoadedScreen extends StatelessWidget {
  final String? username;
  final String userEmail;

  const UserProfileLoadedScreen({
    required this.userEmail,
    this.username,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_16),
      child: Column(
        children: <Widget>[
          UserNameWidget(
            userEmail: userEmail,
            username: username ?? '',
          ),
          const SizedBox(height: AppDimens.PADDING_12),
          const AccountSettingsWidget(),
        ],
      ),
    );
  }
}
