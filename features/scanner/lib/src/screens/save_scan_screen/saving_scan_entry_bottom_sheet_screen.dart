import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'bloc/saving_scan_entry_bloc.dart';
import 'saving_scan_entry_bottom_sheet_content.dart';

@RoutePage()
class SavingScanEntryBottomSheetScreen extends StatelessWidget {
  final String previewFilePath;

  const SavingScanEntryBottomSheetScreen({
    required this.previewFilePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SavingScanEntryBloc>(
      create: (_) => SavingScanEntryBloc(
        appRouter: appLocator<AppRouter>(),
        getAllFoldersUseCase: appLocator<GetAllFoldersUseCase>(),
        getUserCategoriesUseCase: appLocator<GetUserCategoriesUseCase>(),
        createScanEntryUseCase: appLocator<CreateScanEntryUseCase>(),
        appEventNotifier: appLocator.get<AppEventNotifier>(),
        scanPath: previewFilePath,
      ),
      child: const BottomSheetLayout(
        child: SavingScanEntryBottomSheetContent(),
      ),
    );
  }
}
