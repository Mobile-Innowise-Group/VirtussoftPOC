import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/document_scan_bloc.dart';
import '../enum/file_status.dart';

class DownLoadStatusWidget extends StatelessWidget {
  final ScanEntryModel scan;

  const DownLoadStatusWidget({
    super.key,
    required this.scan,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<DocumentScanBloc, DocumentScanState>(
        builder: (BuildContext context, DocumentScanState state) {
          return switch (state.fileStatus) {
            FileStatus.empty => GestureDetector(
                onTap: () => context.read<DocumentScanBloc>().add(
                      DownloadFileEvent(
                        remotePath: scan.remotePath,
                        localPath: scan.localPath,
                      ),
                    ),
                child: Icon(
                  Icons.download,
                  size: 24,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            FileStatus.downloading =>
              const Center(child: CircularProgressIndicator()),
            FileStatus.downloaded => const SizedBox.shrink(),
            FileStatus.error => GestureDetector(
                onTap: () => context.read<DocumentScanBloc>().add(
                      DownloadFileEvent(
                        remotePath: scan.remotePath,
                        localPath: scan.localPath,
                      ),
                    ),
                child: Icon(
                  Icons.error,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
          };
        },
      ),
    );
  }
}
