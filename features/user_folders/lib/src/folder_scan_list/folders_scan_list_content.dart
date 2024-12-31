import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'bloc/folder_scan_list_bloc.dart';

// import 'bloc/folder_scan_list_bloc.dart';

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
            return ListTile(
              leading: const Icon(Icons.tag),
              trailing: const Icon(Icons.share),
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
