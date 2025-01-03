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
        biometricService: appLocator<BiometricService>(),
        appRouter: appLocator<AppRouter>(),
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('folder.privateFolders'.tr()),
        automaticallyImplyLeading: false,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          BlocBuilder<PrivateFoldersBloc, PrivateFoldersState>(
            builder: (BuildContext context, PrivateFoldersState state) {
              if (!state.isAuthenticated) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text('Biometric authentication failed'),
                  ),
                );
              }

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
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      onTap: () => context
                                          .read<PrivateFoldersBloc>()
                                          .add(TogglePrivateFolderPrivacyEvent(
                                              state.folders[index])),
                                      title: Text(
                                        'folder.makeFolderPublic'.tr(),
                                      ),
                                      leading: const Icon(Icons.lock),
                                    ),
                                    ListTile(
                                      onTap: () => context
                                          .read<PrivateFoldersBloc>()
                                          .add(OpenPrivateFolderEvent(
                                              folder: state.folders[index])),
                                      title: Text('folder.openFolder'.tr()),
                                      leading:
                                          const Icon(Icons.open_in_browser),
                                    ),
                                  ],
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
