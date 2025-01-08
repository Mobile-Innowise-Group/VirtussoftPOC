import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'bloc/scanner_bloc.dart';
import 'scanner_content.dart';

@RoutePage()
class ScannerScreen extends StatelessWidget implements AutoRouteWrapper {
  const ScannerScreen({
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ScannerBloc>(
      create: (_) => ScannerBloc(
        appRouter: appLocator<AppRouter>(),
        appEventNotifier: appLocator<AppEventNotifier>(),
      )..add(const OpenScanner()),
      lazy: false,
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'docScanner.docScanner'.tr(),
          style: AppFonts.headingH4,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: const ScannerScreenContent(),
    );
  }
}
