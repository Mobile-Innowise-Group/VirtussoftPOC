import 'package:domain/domain.dart';
import '../entities/folder_entity.dart';

abstract class FolderMapper {
  static FolderModel toModel(FolderEntity folderEntity) {
    return FolderModel(
      id: folderEntity.id,
      name: folderEntity.name,
    );
  }

  static FolderEntity toEntity(CategoryModel folderModel) {
    return FolderEntity(
      id: folderModel.id,
      name: folderModel.name,
    );
  }
}
