import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback? onTap;

  const CategoryCard({
    Key? key,
    required this.category,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(category.name),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            // Handle category deletion
          },
          // onPressed: () => context
          //     .read<UserCategoriesBloc>()
          //     .add(DeleteCategoryEvent(category)),
        ),
        onTap: onTap,
      ),
    );
  }
}
