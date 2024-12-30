import 'package:domain/domain.dart';

import '../scan_entries.dart';

abstract class ScanEntryMapper {
  static ScanEntryModel toModel({
    required ScanEntryEntity scanEntryEntity,
    required FolderModel folder,
    required CategoryModel category,
  }) {
    return ScanEntryModel(
      id: scanEntryEntity.id,
      localPath: scanEntryEntity.localPath,
      remotePath: scanEntryEntity.remotePath,
      category: category,
      folder: folder,
    );
  }

  static ScanEntryEntity toEntity(ScanEntryModel scanEntryModel) {
    return ScanEntryEntity(
      id: scanEntryModel.id,
      localPath: scanEntryModel.localPath,
      remotePath: scanEntryModel.remotePath,
      folderId: scanEntryModel.folder.id,
      categoryId: scanEntryModel.category.id,
    );
  }
}
