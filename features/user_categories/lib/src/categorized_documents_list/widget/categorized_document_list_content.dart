import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:document_scan/document_scan.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/categorized_documents_list_bloc.dart';

class CategorizedDocumentListContent extends StatelessWidget {
  const CategorizedDocumentListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategorizedDocumentsListBloc,
        CategorizedDocumentsListState>(
      builder: (BuildContext context, CategorizedDocumentsListState state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        final List<ScanEntryModel> scanEntryModels = state.shownScanEntries;

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
                    .read<CategorizedDocumentsListBloc>()
                    .add(ShareQrEvent(qrCodeBites: qrCodeBites));
              },
              onClose: () {
                context
                    .read<CategorizedDocumentsListBloc>()
                    .add(const CloseShareQrDialogEvent());
              },
              onShareFile: () => context
                  .read<CategorizedDocumentsListBloc>()
                  .add(ShareFileEvent(scan: scan)),
            );
          },
        );
      },
    );
  }
}
