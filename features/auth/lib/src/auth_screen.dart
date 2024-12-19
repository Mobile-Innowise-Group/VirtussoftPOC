import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'bloc/auth_bloc.dart';

@RoutePage()
class AuthScreen extends StatelessWidget implements AutoRouteWrapper {
  const AuthScreen({
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: const Center(
          child: Text('Auth Screen'),
        ),
      ),
    );
  }
}
