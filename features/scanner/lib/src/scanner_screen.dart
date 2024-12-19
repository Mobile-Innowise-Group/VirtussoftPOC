import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'bloc/scanner_bloc.dart';

@RoutePage()
class ScannerScreen extends StatelessWidget implements AutoRouteWrapper {
  const ScannerScreen({
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ScannerBloc>(
      create: (_) => ScannerBloc(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text('Scanner page'),
      ),
    );
  }
}
