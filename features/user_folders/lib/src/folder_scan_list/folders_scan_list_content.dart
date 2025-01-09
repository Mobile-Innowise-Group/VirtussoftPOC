import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:document_scan/document_scan.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'bloc/folder_scan_list_bloc.dart';

class FoldersScanListContent extends StatelessWidget {
  const FoldersScanListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FolderScanListBloc, FolderScanListState>(
      builder: (BuildContext context, FolderScanListState state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        final List<ScanEntryModel> scanEntryModels = state.scans;

        if (scanEntryModels.isEmpty) {
          return Center(
            child: Text(
              'No scans added',
              style: AppFonts.headingH4,
            ),
          );
        }

        return ListView.builder(
          itemCount: scanEntryModels.length,
          itemBuilder: (BuildContext context, int index) {
            final ScanEntryModel scan = scanEntryModels[index];

            return DocumentScan(
              scan: scan,
              onShareQr: (Uint8List qrCodeBites) {
                context
                    .read<FolderScanListBloc>()
                    .add(ShareQrEvent(qrCodeBites: qrCodeBites));
              },
              onClose: () {
                context
                    .read<FolderScanListBloc>()
                    .add(const CloseShareQrDialogEvent());
              },
              onShareFile: () => context
                  .read<FolderScanListBloc>()
                  .add(ShareFileEvent(scan: scan)),
            );
          },
        );
      },
    );
  }
}
