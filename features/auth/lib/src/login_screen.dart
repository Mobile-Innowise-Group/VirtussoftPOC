import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'auth_bloc/auth_bloc.dart';
import 'widgets/login_screen_content.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(
        biometricService: appLocator<BiometricService>(),
        appRouter: appLocator<AppRouter>(),
        signUpWithCredentialsUseCase: appLocator.get<SignUpWithCredentialsUseCase>(),
        signInWithCredentialsUseCase: appLocator.get<SignInWithCredentialsUseCase>(),
        getCurrentUserUseCase: appLocator.get<GetCurrentUserUseCase>(),
        appEventNotifier: appLocator.get<AppEventNotifier>(),
      ),
      child: const LoginScreenContent(),
    );
  }
}
