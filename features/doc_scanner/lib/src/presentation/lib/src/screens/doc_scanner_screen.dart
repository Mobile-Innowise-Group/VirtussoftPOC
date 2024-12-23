import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../doc_scanner_bloc/doc_scanner_bloc.dart';
import 'screens.dart';

@RoutePage()
class DocScannerScreen extends StatelessWidget {
  const DocScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DocScannerBloc>(
      create: (_) => DocScannerBloc(
        appRouter: appLocator<AppRouter>(),

      ),
      child: const DocScannerScreenContent(),
    );
  }
}
