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
      path: scanEntryEntity.path,
      category: category,
      folder: folder,
    );
  }

  static ScanEntryEntity toEntity(ScanEntryModel scanEntryModel) {
    return ScanEntryEntity(
      id: scanEntryModel.id,
      path: scanEntryModel.path,
      folderId: scanEntryModel.folder.id,
      categoryId: scanEntryModel.category.id,
    );
  }
}
