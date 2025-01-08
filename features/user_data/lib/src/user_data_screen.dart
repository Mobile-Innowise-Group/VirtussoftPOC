import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:nested/nested.dart';
import 'package:user_categories/src/user_categories/bloc/user_categories_bloc.dart';
import 'package:user_categories/src/user_categories/user_categories.dart';
import 'package:user_folders/src/user_folders/user_folders.dart';

import 'bloc/user_data_bloc.dart';

@RoutePage()
class UserDataScreen extends StatelessWidget implements AutoRouteWrapper {
  const UserDataScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: <SingleChildWidget>[
        BlocProvider<UserDataBloc>(
          create: (_) => UserDataBloc(),
        ),
        BlocProvider<UserCategoriesBloc>(
          create: (_) => UserCategoriesBloc(
            appEventNotifier: appLocator<AppEventNotifier>(),
            appRouter: appLocator<AppRouter>(),
            createCategoryUseCase: appLocator<CreateCategoryUseCase>(),
            getUserCategoriesUseCase: appLocator<GetUserCategoriesUseCase>(),
            deleteCategoryUseCase: appLocator<DeleteCategoryUseCase>(),
          ),
        ),
        BlocProvider<UserFoldersBloc>(
          create: (_) => UserFoldersBloc(
            appEventNotifier: appLocator<AppEventNotifier>(),
            appRouter: appLocator<AppRouter>(),
            createFolderUseCase: appLocator<CreateFolderUseCase>(),
            deleteFolderUseCase: appLocator<DeleteFolderUseCase>(),
            getFoldersUseCase: appLocator<GetPublicFoldersUseCase>(),
            toggleFolderPrivacyUseCase:
                appLocator<ToggleFolderPrivacyUseCase>(),
          ),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'data.userData'.tr(),
          style: AppFonts.headingH4,
        ),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {},
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocBuilder<UserDataBloc, int>(
          builder: (BuildContext context, int state) {
            return Column(
              children: <Widget>[
                const SizedBox(height: 10),
                Container(
                  height: 39,
                  width: double.infinity,
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius:
                        BorderRadius.circular(AppDimens.BORDER_RADIUS_16),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () => context.read<UserDataBloc>().add(
                                ToggleViewButtonEvent(
                                  index: 0,
                                ),
                              ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: state == 0
                                  ? Theme.of(context).colorScheme.surface
                                  : Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(
                                AppDimens.BORDER_RADIUS_16,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'folder.byFolders'.tr(),
                                style: AppFonts.headingH5.copyWith(
                                  color: state == 0
                                      ? Theme.of(context).colorScheme.onSurface
                                      : AppColors.of(context).textSecondary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: VerticalDivider(
                          color: AppColors.of(context).divider,
                          thickness: 1,
                          width: 1,
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => context.read<UserDataBloc>().add(
                                ToggleViewButtonEvent(
                                  index: 1,
                                ),
                              ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: state == 1
                                  ? Theme.of(context).colorScheme.surface
                                  : Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(
                                  AppDimens.BORDER_RADIUS_16),
                            ),
                            child: Center(
                              child: Text(
                                'category.byCategory'.tr(),
                                style: AppFonts.headingH5.copyWith(
                                  color: state == 1
                                      ? Theme.of(context).colorScheme.onSurface
                                      : AppColors.of(context).textSecondary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: IndexedStack(
                    index: state,
                    children: const <Widget>[
                      UserFolders(),
                      UserCategories(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
