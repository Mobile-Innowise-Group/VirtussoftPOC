import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:user_folders/src/user_folder/bloc/user_folder_bloc.dart';

import 'bloc/private_folders_bloc.dart';
import 'widgets/private_folder_widget.dart';

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
        title: Text(
          'folder.privateFolders'.tr(),
          style: AppFonts.headingH4,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<PrivateFoldersBloc, PrivateFoldersState>(
        builder: (BuildContext context, PrivateFoldersState state) {
          if (!state.isAuthenticated) {
            return Center(
              child: Text(
                'Biometric authentication failed',
                style: AppFonts.headingH5,
              ),
            );
          }

          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<FolderModel> privateFolders = state.folders;

          return Column(
            children: <Widget>[
              Expanded(
                child: privateFolders.isEmpty
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
                                    folder: privateFolders[index],
                                    appRouter: appLocator<AppRouter>(),
                                  ),
                                  child: const PrivateFolderWidget(),
                                );
                              },
                              childCount: privateFolders.length,
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
                            context.read<PrivateFoldersBloc>().add(
                                  CreatePrivateFolderEvent(
                                      folderName: folderName),
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
      ),
    );
  }
}
