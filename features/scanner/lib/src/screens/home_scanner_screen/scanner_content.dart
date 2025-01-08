import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'bloc/scanner_bloc.dart';

class ScannerScreenContent extends StatelessWidget {
  const ScannerScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: FilledButton(
          onPressed: () => context.read<ScannerBloc>().add(const OpenScanner()),
          child: const Text('Scan Document'),
        ),
      ),
    );
  }
}
