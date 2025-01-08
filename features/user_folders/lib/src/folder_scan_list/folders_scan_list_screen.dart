import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'bloc/folder_scan_list_bloc.dart';
import 'folders_scan_list_content.dart';

@RoutePage()
class FoldersScanListScreen extends StatelessWidget
    implements AutoRouteWrapper {
  final FolderModel folder;

  const FoldersScanListScreen({
    required this.folder,
    Key? key,
  }) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<FolderScanListBloc>(
      create: (_) => FolderScanListBloc(
        appRouter: appLocator<AppRouter>(),
        appEventNotifier: appLocator.get<AppEventNotifier>(),
        getScanEntriesByFolderUseCase:
            appLocator.get<GetScanEntriesByFolderUseCase>(),
        folder: folder,
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          folder.name,
          style: AppFonts.headingH4,
        ),
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
      body: const FoldersScanListContent(),
    );
  }
}
