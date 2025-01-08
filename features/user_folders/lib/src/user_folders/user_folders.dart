import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../user_folder/bloc/user_folder_bloc.dart';
import '../user_folder/user_folder_widget.dart';

class UserFolders extends StatelessWidget {
  const UserFolders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFoldersBloc, UserFoldersState>(
      builder: (BuildContext context, UserFoldersState state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        final List<FolderModel> folders = state.folders;

        return Column(
          children: <Widget>[
            Expanded(
              child: folders.isEmpty
                  ? Text(
                      'folder.noAddedFolders'.tr(),
                      style: AppFonts.headingH5,
                    )
                  : CustomScrollView(
                      slivers: <Widget>[
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return BlocProvider<UserFolderBloc>(
                                create: (_) => UserFolderBloc(
                                  folder: folders[index],
                                  appRouter: appLocator<AppRouter>(),
                                ),
                                child: const UserFolderWidget(),
                              );
                            },
                            childCount: folders.length,
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
                  'folder.addNewFolder'.tr(),
                  style: AppFonts.actionM.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext _) {
                      return CreateFolderDialog(
                        optionNoCallback: () {
                          final AppRouter appRouter = appLocator<AppRouter>();
                          appRouter.maybePop();
                        },
                        optionYesCallback: (String folderName) {
                          context.read<UserFoldersBloc>().add(
                                CreateFolderEvent(folderName: folderName),
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
