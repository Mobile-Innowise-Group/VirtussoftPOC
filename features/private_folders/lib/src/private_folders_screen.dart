import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'bloc/private_folders_bloc.dart';
import 'widgets/create_private_folder_dialog.dart';

@RoutePage()
class PrivateFoldersScreen extends StatelessWidget implements AutoRouteWrapper {
  const PrivateFoldersScreen({
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<PrivateFoldersBloc>(
      create: (_) => PrivateFoldersBloc(
        appEventNotifier: appLocator<AppEventNotifier>(),
        getPrivateFoldersUseCase: appLocator<GetPrivateFoldersUseCase>(),
        createPrivateFolderUseCase: appLocator<CreatePrivateFolderUseCase>(),
        toggleFolderPrivacyUseCase: appLocator<ToggleFolderPrivacyUseCase>(),
        appRouter: appLocator<AppRouter>(),
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO Sihau - Add localization
        title: Text('Private folders'),
        automaticallyImplyLeading: false,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          BlocBuilder<PrivateFoldersBloc, PrivateFoldersState>(
            builder: (BuildContext context, PrivateFoldersState state) {
              if (state.isLoading) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              return state.folders.isEmpty
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
                          return ListTile(
                            onTap: () {
                              AppBottomSheet.show(
                                context: context,
                                child: ListTile(
                                  onTap: () => context
                                      .read<PrivateFoldersBloc>()
                                      .add(ToggleFolderPrivacyEvent(
                                          state.folders[index])),
                                  //TODO Sihau - Add localization
                                  title: const Text('Make directory private'),
                                  leading: const Icon(Icons.lock),
                                ),
                              );
                            },
                            leading: const Icon(Icons.folder),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            title: Text(state.folders[index].name),
                          );
                        },
                        childCount: state.folders.length,
                      ),
                    );
            },
          ),
          SliverToBoxAdapter(
            child: ListTile(
              leading: const Icon(Icons.add),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext _) {
                    return CreatePrivateFolderDialog(
                      onCreate: (String folderName) {
                        context.read<PrivateFoldersBloc>().add(
                              CreatePrivateFolderEvent(folderName: folderName),
                            );
                      },
                    );
                  },
                );
              },
              title: Text('folder.addFolder'.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
