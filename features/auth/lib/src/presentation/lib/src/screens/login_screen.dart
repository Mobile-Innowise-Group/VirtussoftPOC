import 'package:auth/src/domain/lib/domain.dart';
import 'package:biometrics/biometrics.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../auth_bloc/auth_bloc.dart';
import 'screens.dart';

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
        signOutUseCase: appLocator.get<SignOutUseCase>(),
        getCurrentUserUseCase: appLocator.get<GetCurrentUserUsecase>(),
      )..add(
          GetCurrentUser(),
        ),
      child: const LoginScreenContent(),
    );
  }
}
