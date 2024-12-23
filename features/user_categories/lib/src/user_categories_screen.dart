import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'bloc/user_categories_bloc.dart';
import 'widgets/category_card.dart';
import 'widgets/create_category_dialog.dart';

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
        deleteCategoryUseCase: appLocator<DeleteCategoryUseCase>(),
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
            return ListView.separated(
              itemCount: state.categories.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryCard(
                  category: state.categories[index],
                  onTap: () {
                    // Handle card tap
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext _) {
              return CreateCategoryDialog(
                onCreate: (String categoryName) {
                  context.read<UserCategoriesBloc>().add(
                        CreateCategoryEvent(categoryName: categoryName),
                      );
                },
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
