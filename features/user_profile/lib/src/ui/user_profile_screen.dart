import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/user_profile_bloc.dart';
import 'user_profile_content.dart';

@RoutePage()
class UserProfileScreen extends StatelessWidget implements AutoRouteWrapper {
  const UserProfileScreen({
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<UserProfileBloc>(
      create: (_) => UserProfileBloc(
        getCurrentUserUseCase: appLocator<GetCurrentUserUseCase>(),
        signOutUseCase: appLocator<SignOutUseCase>(),
        appRouter: appLocator<AppRouter>(),
      )..add(
          InitUserProfileEvent(),
        ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User profile',
          style: AppFonts.headingH4,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: const UserProfileContent(),
    );
  }
}
