import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'bloc/user_categories_bloc.dart';
import 'widgets/create_category_dialog.dart';
import 'widgets/user_category_widget.dart';

class UserCategories extends StatelessWidget {
  const UserCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCategoriesBloc, UserCategoriesState>(
      builder: (BuildContext context, UserCategoriesState state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final List<CategoryModel> categories = state.categories;

        return Column(
          children: <Widget>[
            Expanded(
              child: categories.isEmpty
                  ? Text(
                      'category.noAddedCategories'.tr(),
                      style: AppFonts.headingH5,
                    )
                  : CustomScrollView(
                      slivers: <Widget>[
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return UserCategoryWidget(
                                category: categories[index],
                              );
                            },
                            childCount: categories.length,
                          ),
                        ),
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: TextButton.icon(
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.primary,
                ),
                label: Text(
                  'category.addNewCategory'.tr(),
                  style: AppFonts.actionM.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext _) {
                      return CreateCategoryDialog(
                        optionNoCallback: () {
                          final AppRouter appRouter = appLocator<AppRouter>();
                          appRouter.maybePop();
                        },
                        optionYesCallback: (String categoryName) {
                          context.read<UserCategoriesBloc>().add(
                                CreateCategoryEvent(categoryName: categoryName),
                              );
                          final AppRouter appRouter = appLocator<AppRouter>();
                          appRouter.maybePop();
                        },
                      );
                    },
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
