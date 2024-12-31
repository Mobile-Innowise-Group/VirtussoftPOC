import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart' as nav;
import 'bloc/saving_scan_entry_bloc.dart';
import 'saving_scan_entry_bottom_sheet_content.dart';

@nav.RoutePage()
class SavingScanEntryBottomSheetScreen extends StatelessWidget implements nav.AutoRouteWrapper {
  final String scanPath;

  const SavingScanEntryBottomSheetScreen({
    required this.scanPath,
    Key? key,
  }) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SavingScanEntryBloc>(
      create: (_) => SavingScanEntryBloc(
        appRouter: appLocator<nav.AppRouter>(),
        getFoldersUseCase: appLocator<GetFoldersUseCase>(),
        getUserCategoriesUseCase: appLocator<GetUserCategoriesUseCase>(),
        createScanEntryUseCase: appLocator<CreateScanEntryUseCase>(),
        appEventNotifier: appLocator.get<AppEventNotifier>(),
        scanPath: scanPath,
      )..add(const InitEvent()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SavingScanEntryBottomSheetContent();
  }
}
