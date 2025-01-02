import 'package:domain/domain.dart';
import '../folders.dart';

abstract class FolderMapper {
  static FolderModel toModel(FolderEntity folderEntity) {
    return FolderModel(
      id: folderEntity.id,
      name: folderEntity.name,
      isPrivate: folderEntity.isPrivate,
    );
  }

  static FolderModel toModelFromLocal(FolderLocalEntity folderEntity) {
    return FolderModel(
      id: folderEntity.id,
      name: folderEntity.name,
      isPrivate: folderEntity.isPrivate == 1,
    );
  }

  static FolderEntity toEntity(FolderModel folderModel) {
    return FolderEntity(
      id: folderModel.id,
      name: folderModel.name,
      isPrivate: folderModel.isPrivate,
    );
  }

  static FolderLocalEntity toLocalEntity(FolderModel folderModel) {
    return FolderLocalEntity(
      id: folderModel.id,
      name: folderModel.name,
      isPrivate: folderModel.isPrivate ? 1 : 0,
    );
  }
}
