import '../../../domain.dart';

class ScanEntryModel {
  final String id;
  final String localPath;
  final String remotePath;
  final CategoryModel category;
  final FolderModel folder;

  ScanEntryModel({
    required this.id,
    required this.localPath,
    required this.remotePath,
    required this.category,
    required this.folder,
  });
}
