import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'bloc/user_categories/user_categories_bloc.dart';
import 'bloc/user_folders_bloc/user_folders_bloc.dart';
import 'widgets/create_folder_dialog.dart';
import 'widgets/folder_card.dart';

@RoutePage()
class UserCategoriesScreen extends StatefulWidget implements AutoRouteWrapper {
  const UserCategoriesScreen({super.key});

  @override
  _UserCategoriesScreenState createState() => _UserCategoriesScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<UserFoldersBloc>(
      create: (_) => UserFoldersBloc(
        createFolderUseCase: appLocator<CreateFolderUseCase>(),
        appEventNotifier: appLocator<AppEventNotifier>(),
        deleteFolderUseCase: appLocator<DeleteFolderUseCase>(),
        getFoldersUseCase: appLocator<GetFoldersUseCase>(),
        appRouter: appLocator<AppRouter>(),
      ),
      child: this,
    );
  }
}

class _UserCategoriesScreenState extends State<UserCategoriesScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Folders'),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<UserFoldersBloc, UserFoldersState>(
        builder: (BuildContext context, UserFoldersState state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final List<FolderModel> folders =
                _isExpanded ? state.folders : state.folders.take(3).toList();
            return CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      if (index < folders.length) {
                        return FolderCard(folder: folders[index]);
                      } else if (index == folders.length) {
                        return TextButton(
                          onPressed: () {
                            setState(() {
                              _isExpanded = !_isExpanded;
                            });
                          },
                          child: Text(_isExpanded ? 'Show Less' : 'Show More'),
                        );
                      } else {
                        return null;
                      }
                    },
                    childCount: folders.length + 1,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CreateFolderDialog(
                              onCreate: (String folderName) {
                                // context.read<UserCategoriesBloc>().add(
                                //       CreateFolderEvent(folderName: folderName),
                                //     );
                              },
                            );
                          },
                        );
                      },
                      child: const Text('Add Folder'),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
