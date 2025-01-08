import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/user_categories_bloc.dart';

class UserCategoryWidget extends StatelessWidget {
  final CategoryModel category;

  const UserCategoryWidget({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context
          .read<UserCategoriesBloc>()
          .add(OpenCategoryEvent(category: category)),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/tag.svg',
              colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.primary, BlendMode.srcIn),
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                category.name,
                style: AppFonts.headingH5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
