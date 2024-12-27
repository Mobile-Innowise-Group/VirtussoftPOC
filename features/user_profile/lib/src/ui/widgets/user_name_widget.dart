import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../../bloc/user_profile_bloc.dart';

class UserNameWidget extends StatelessWidget {
  final String username;
  final String userEmail;

  const UserNameWidget({
    required this.username,
    required this.userEmail,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final AppColors colors = AppColors.of(context);
    final UserProfileBloc bloc = BlocProvider.of<UserProfileBloc>(context);
    final AppRouter appRouter = appLocator.get<AppRouter>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              radius: AppDimens.BORDER_RADIUS_23,
              backgroundColor: colors.secondary,
            ),
            const SizedBox(width: AppDimens.PADDING_12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(userEmail),
                Text(username, style: textTheme.titleMedium),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AppAlertDialog(
                text: 'Do you really want to sign out?',
                optionNoCallback: () => appRouter.maybePop(
                  const HomeRoute(),
                ),
                optionYesCallback: () => bloc.add(
                  SignOutEvent(),
                ),
              );
            },
          ),
          icon: const Icon(Icons.logout),
        )
      ],
    );
  }
}
