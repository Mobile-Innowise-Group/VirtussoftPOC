import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'bloc/folder_scan_list_bloc.dart';
import 'share_scan_dialog/create_folder_dialog.dart';

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
          return const Center(
            child: Text('No scans added'),
          );
        }

        return ListView.builder(
          itemCount: scanEntryModels.length,
          itemBuilder: (BuildContext context, int index) {
            final ScanEntryModel scan = scanEntryModels[index];

            return ListTile(
              onTap: () {
                context.read<FolderScanListBloc>().add(
                      OpenScanEvent(localUrl: scan.localPath),
                    );
              },
              leading: const Icon(Icons.tag),
              trailing: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext _) {
                      return ShareScanDialog(
                        onShare: (Uint8List qrCodeBites) {
                          context.read<FolderScanListBloc>().add(ShareQrEvent(qrCodeBites: qrCodeBites));
                        },
                        onClose: () {
                          context.read<FolderScanListBloc>().add(const CloseShareQrDialogEvent());
                        },
                        remoteUrl: scan.remotePath,
                      );
                    },
                  );
                },
                child: const Icon(Icons.share),
              ),
              title: Text(
                PdfService.getFileNameByPath(scanEntryModels[index].localPath),
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        );
      },
    );
  }
}
