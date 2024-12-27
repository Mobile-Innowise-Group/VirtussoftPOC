import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/user_profile_bloc.dart';
import 'user_profile_loaded_screen.dart';

class UserProfileContent extends StatelessWidget {
  const UserProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (_, UserProfileState state) {
        return switch (state) {
          UserProfileLoadingState() => const LoadingScreen(),
          UserProfileErrorState() => ErrorScreen(
              errorMessage: state.errorMessage,
            ),
          UserProfileSuccessState() => UserProfileLoadedScreen(
              username: state.userModel.username,
              userEmail: state.userModel.email,
            ),
        };
      },
    );
  }
}
