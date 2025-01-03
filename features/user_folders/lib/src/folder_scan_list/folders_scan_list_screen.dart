import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart' as nav;

import 'bloc/folder_scan_list_bloc.dart';
import 'folders_scan_list_content.dart';

@nav.RoutePage()
class FoldersScanListScreen extends StatelessWidget implements nav.AutoRouteWrapper {
  final FolderModel folder;

  const FoldersScanListScreen({
    required this.folder,
    Key? key,
  }) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<FolderScanListBloc>(
      create: (_) => FolderScanListBloc(
        appRouter: appLocator<nav.AppRouter>(),
        appEventNotifier: appLocator.get<AppEventNotifier>(),
        getScanEntriesByFolderUseCase: appLocator.get<GetScanEntriesByFolderUseCase>(),
        folder: folder,
      )..add(const InitEvent()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(folder.name),
        automaticallyImplyLeading: false,
      ),
      body: const FoldersScanListContent(),
    );
  }
}
