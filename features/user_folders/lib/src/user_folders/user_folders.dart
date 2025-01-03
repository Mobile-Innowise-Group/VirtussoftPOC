import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'bloc/user_folders_bloc.dart';

class UserFolders extends StatelessWidget {
  const UserFolders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFoldersBloc, UserFoldersState>(
      builder: (BuildContext context, UserFoldersState state) {
        if (state.isLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final List<FolderModel> folders =
            state.isExpanded ? state.folders : state.folders.take(3).toList();

        return folders.isEmpty
            ? SliverToBoxAdapter(
                child: ListTile(
                  title: Text(
                    'folder.noAddedFolders'.tr(),
                  ),
                ),
              )
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (index < folders.length) {
                      return ListTile(
                        onTap: () {
                          AppBottomSheet.show(
                            context: context,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  onTap: () => context
                                      .read<UserFoldersBloc>()
                                      .add(ToggleFolderPrivacyEvent(
                                          state.folders[index])),
                                  title: Text(
                                    'folder.makeFolderPrivate'.tr(),
                                  ),
                                  leading: const Icon(Icons.lock),
                                ),
                                ListTile(
                                  onTap: () {
                                    context.read<UserFoldersBloc>().add(
                                        OpenFolderEvent(
                                            folder: folders[index]));
                                  },
                                  title: Text('folder.openFolder'.tr()),
                                  leading: const Icon(Icons.open_in_browser),
                                ),
                              ],
                            ),
                          );
                        },
                        leading: const Icon(Icons.folder),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        title: Text(folders[index].name),
                      );
                    } else if (index == folders.length &&
                        state.folders.length > 3) {
                      return TextButton(
                        onPressed: () => context
                            .read<UserFoldersBloc>()
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
                  childCount: folders.length + 1,
                ),
              );
      },
    );
  }
}
