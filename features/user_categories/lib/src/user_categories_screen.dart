import 'package:core/core.dart';
import 'package:domain/domain.dart';
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
      create: (_) => UserCategoriesBloc(
        createCategoryUseCase: appLocator<CreateCategoryUseCase>(),
        appEventNotifier: appLocator<AppEventNotifier>(),
        appRouter: appLocator<AppRouter>(),
        getUserCategoriesUseCase: appLocator<GetUserCategoriesUseCase>(),
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User categories'),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<UserCategoriesBloc, UserCategoriesState>(
        builder: (BuildContext context, UserCategoriesState state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: state.categories.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(state.categories[index].name),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<UserCategoriesBloc>().add(
              const CreateCategoryEvent(),
            ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
