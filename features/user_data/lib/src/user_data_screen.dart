import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:nested/nested.dart';
import 'package:user_categories/src/bloc/user_categories_bloc.dart';
import 'package:user_categories/src/user_categories.dart';
import 'package:user_categories/src/widgets/create_category_dialog.dart';
import 'package:user_folders/src/user_folders/user_folders.dart';
import 'package:user_folders/src/user_folders/widgets/create_folder_dialog.dart';

import 'bloc/user_data_bloc.dart';

@RoutePage()
class UserDataScreen extends StatefulWidget implements AutoRouteWrapper {
  const UserDataScreen({super.key});

  @override
  _UserDataScreenState createState() => _UserDataScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: <SingleChildWidget>[
        BlocProvider<UserDataBloc>(
          create: (_) => UserDataBloc(
            appRouter: appLocator<AppRouter>(),
            biometricService: appLocator<BiometricService>(),
            appEventNotifier: appLocator<AppEventNotifier>(),
          ),
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
}

class _UserDataScreenState extends State<UserDataScreen> {
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
              title: Text('folder.addFolder'.tr()),
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
