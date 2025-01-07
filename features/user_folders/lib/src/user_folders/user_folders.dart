import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'bloc/user_folders_bloc.dart';
import 'widgets/create_folder_dialog.dart';

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
                              return InkWell(
                                onTap: () => context
                                    .read<UserFoldersBloc>()
                                    .add(OpenFolderEvent(
                                        folder: folders[index])),
                                onLongPress: () {
                                  AppBottomSheet.show(
                                    context: context,
                                    child: ListTile(
                                      onTap: () => context
                                          .read<UserFoldersBloc>()
                                          .add(ToggleFolderPrivacyEvent(
                                              folders[index])),
                                      title: Text(
                                        'folder.makeFolderPrivate'.tr(),
                                      ),
                                      leading: const Icon(Icons.lock),
                                    ),
                                  );
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 72,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        'assets/icons/folder.svg',
                                        colorFilter: ColorFilter.mode(
                                            Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            BlendMode.srcIn),
                                        width: 40,
                                        height: 40,
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              folders[index].name,
                                              style: AppFonts.headingH5,
                                            ),
                                            Text(
                                              '12',
                                              style: AppFonts.bodyS,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                  style: AppFonts.actionM,
                ),
                onPressed: () {
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
              ),
            )
          ],
        );
        ;
      },
    );
  }
}
