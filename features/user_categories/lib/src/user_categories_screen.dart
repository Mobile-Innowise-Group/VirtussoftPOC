import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'bloc/user_categories_bloc.dart';

@RoutePage()
class UserCategoriesScreen extends StatelessWidget implements AutoRouteWrapper {
  const UserCategoriesScreen({
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<UserCategoriesBloc>(
      create: (_) => UserCategoriesBloc(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text('User categories page'),
      ),
    );
  }
}
