import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'bloc/user_categories_bloc.dart';

class UserCategories extends StatelessWidget {
  const UserCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCategoriesBloc, UserCategoriesState>(
      builder: (BuildContext context, UserCategoriesState state) {
        if (state.isLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final List<CategoryModel> categories = state.isExpanded
            ? state.categories
            : state.categories.take(3).toList();
        return categories.isEmpty
            ? SliverToBoxAdapter(
                child: ListTile(
                  title: Text('category.noAddedCategories'.tr()),
                ),
              )
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (index < categories.length) {
                      return ListTile(
                        leading: const Icon(Icons.tag),
                        title: Text(categories[index].name),
                      );
                    } else if (index == categories.length &&
                        state.categories.length > 3) {
                      return TextButton(
                        onPressed: () => context
                            .read<UserCategoriesBloc>()
                            .add(const ToggleExpandedEvent()),
                        child: Text(
                          state.isExpanded
                              ? 'common.showLess'.tr()
                              : 'common.showMore'.tr(),
                        ),
                      );
                    } else {
                      return null;
                    }
                  },
                  childCount: categories.length + 1,
                ),
              );
      },
    );
  }
}
