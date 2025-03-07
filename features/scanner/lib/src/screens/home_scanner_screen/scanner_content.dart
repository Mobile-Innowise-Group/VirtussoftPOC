import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'bloc/scanner_bloc.dart';

class ScannerScreenContent extends StatelessWidget {
  const ScannerScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: BlocBuilder<ScannerBloc, ScannerState>(
          builder: (BuildContext context, ScannerState state) {
            return state.isProcessing
                ? const CircularProgressIndicator()
                : AppButton(
                    onPressed: () => context.read<ScannerBloc>().add(const OpenScanner()),
                    text: 'Scan Document',
                  );
          },
        ),
      ),
    );
  }
}
