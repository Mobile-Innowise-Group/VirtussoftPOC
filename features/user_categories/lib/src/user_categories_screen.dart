import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:nested/nested.dart';

import 'bloc/user_categories/user_categories_bloc.dart';
import 'bloc/user_folders_bloc/user_folders_bloc.dart';
import 'widgets/categories/create_category_dialog.dart';
import 'widgets/categories/user_categories.dart';
import 'widgets/folders/create_folder_dialog.dart';
import 'widgets/folders/user_folders.dart';

@RoutePage()
class UserCategoriesScreen extends StatefulWidget implements AutoRouteWrapper {
  const UserCategoriesScreen({super.key});

  @override
  _UserCategoriesScreenState createState() => _UserCategoriesScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: <SingleChildWidget>[
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
            getFoldersUseCase: appLocator<GetFoldersUseCase>(),
          ),
        ),
      ],
      child: this,
    );
  }
}

class _UserCategoriesScreenState extends State<UserCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data.userData'.tr()),
        automaticallyImplyLeading: false,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const UserFolders(),
          SliverToBoxAdapter(
            child: ListTile(
              leading: const Icon(Icons.add),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext _) {
                    return CreateFolderDialog(
                      onCreate: (String folderName) {
                        context.read<UserFoldersBloc>().add(
                              CreateFolderEvent(folderName: folderName),
                            );
                      },
                    );
                  },
                );
              },
              title: Text('folders.addFolder'.tr()),
            ),
          ),
          const SliverToBoxAdapter(child: Divider()),
          const UserCategories(),
          SliverToBoxAdapter(
            child: ListTile(
              leading: const Icon(Icons.add),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext _) {
                    return CreateCategoryDialog(
                      onCreate: (String folderName) {
                        context.read<UserCategoriesBloc>().add(
                              CreateCategoryEvent(categoryName: folderName),
                            );
                      },
                    );
                  },
                );
              },
              title: Text('category.addCategory'.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
