import '../../../domain.dart';

class ScanEntryModel {
  final String id;
  final String path;
  final CategoryModel category;
  final FolderModel folder;

  ScanEntryModel({
    required this.id,
    required this.path,
    required this.category,
    required this.folder,
  });
}
