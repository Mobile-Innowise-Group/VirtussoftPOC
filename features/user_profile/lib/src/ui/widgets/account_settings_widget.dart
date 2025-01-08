import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import '../../bloc/user_profile_bloc.dart';
import 'settings_category_widget.dart';

class AccountSettingsWidget extends StatelessWidget {
  const AccountSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 24),
        SettingsCategoryWidget(title: 'Edit Email', onTap: () {}),
        Divider(thickness: 1, height: 1, color: AppColors.of(context).divider),
        SettingsCategoryWidget(title: 'Edit Username', onTap: () {}),
        Divider(thickness: 1, height: 1, color: AppColors.of(context).divider),
        SettingsCategoryWidget(title: 'Delete Profile', onTap: () {}),
        Divider(thickness: 1, height: 1, color: AppColors.of(context).divider),
        SettingsCategoryWidget(
            title: 'Log out',
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext _) {
                  final AppRouter appRouter = appLocator<AppRouter>();
                  return AppAlertDialog(
                    text: 'Do you really want to sign out?',
                    optionNoCallback: () => appRouter.maybePop(
                      const HomeRoute(),
                    ),
                    optionYesCallback: () =>
                        context.read<UserProfileBloc>().add(
                              SignOutEvent(),
                            ),
                  );
                },
              );
            }),
      ],
    );
  }
}
