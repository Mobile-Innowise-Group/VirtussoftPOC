import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'bloc/private_folders_bloc.dart';

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
        appRouter: appLocator<AppRouter>(),
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                          return GestureDetector(
                            onLongPress: () {
                              print('Long press');
                            },
                            child: ListTile(
                              leading: const Icon(Icons.folder),
                              trailing: const Icon(Icons.arrow_forward_ios),
                              title: Text(state.folders[index].name),
                            ),
                          );
                        },
                        childCount: state.folders.length,
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
