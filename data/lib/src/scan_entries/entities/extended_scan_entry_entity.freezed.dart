// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extended_scan_entry_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExtendedScanEntryEntity _$ExtendedScanEntryEntityFromJson(
    Map<String, dynamic> json) {
  return _ExtendedScanEntryEntity.fromJson(json);
}

/// @nodoc
mixin _$ExtendedScanEntryEntity {
  String get id => throw _privateConstructorUsedError;
  String get localPath => throw _privateConstructorUsedError;
  String get remotePath => throw _privateConstructorUsedError;
  FolderEntity get folder => throw _privateConstructorUsedError;
  CategoryEntity get category => throw _privateConstructorUsedError;

  /// Serializes this ExtendedScanEntryEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtendedScanEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtendedScanEntryEntityCopyWith<ExtendedScanEntryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtendedScanEntryEntityCopyWith<$Res> {
  factory $ExtendedScanEntryEntityCopyWith(ExtendedScanEntryEntity value,
          $Res Function(ExtendedScanEntryEntity) then) =
      _$ExtendedScanEntryEntityCopyWithImpl<$Res, ExtendedScanEntryEntity>;
  @useResult
  $Res call(
      {String id,
      String localPath,
      String remotePath,
      FolderEntity folder,
      CategoryEntity category});

  $FolderEntityCopyWith<$Res> get folder;
  $CategoryEntityCopyWith<$Res> get category;
}

/// @nodoc
class _$ExtendedScanEntryEntityCopyWithImpl<$Res,
        $Val extends ExtendedScanEntryEntity>
    implements $ExtendedScanEntryEntityCopyWith<$Res> {
  _$ExtendedScanEntryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtendedScanEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? localPath = null,
    Object? remotePath = null,
    Object? folder = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      localPath: null == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String,
      remotePath: null == remotePath
          ? _value.remotePath
          : remotePath // ignore: cast_nullable_to_non_nullable
              as String,
      folder: null == folder
          ? _value.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as FolderEntity,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryEntity,
    ) as $Val);
  }

  /// Create a copy of ExtendedScanEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FolderEntityCopyWith<$Res> get folder {
    return $FolderEntityCopyWith<$Res>(_value.folder, (value) {
      return _then(_value.copyWith(folder: value) as $Val);
    });
  }

  /// Create a copy of ExtendedScanEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryEntityCopyWith<$Res> get category {
    return $CategoryEntityCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExtendedScanEntryEntityImplCopyWith<$Res>
    implements $ExtendedScanEntryEntityCopyWith<$Res> {
  factory _$$ExtendedScanEntryEntityImplCopyWith(
          _$ExtendedScanEntryEntityImpl value,
          $Res Function(_$ExtendedScanEntryEntityImpl) then) =
      __$$ExtendedScanEntryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String localPath,
      String remotePath,
      FolderEntity folder,
      CategoryEntity category});

  @override
  $FolderEntityCopyWith<$Res> get folder;
  @override
  $CategoryEntityCopyWith<$Res> get category;
}

/// @nodoc
class __$$ExtendedScanEntryEntityImplCopyWithImpl<$Res>
    extends _$ExtendedScanEntryEntityCopyWithImpl<$Res,
        _$ExtendedScanEntryEntityImpl>
    implements _$$ExtendedScanEntryEntityImplCopyWith<$Res> {
  __$$ExtendedScanEntryEntityImplCopyWithImpl(
      _$ExtendedScanEntryEntityImpl _value,
      $Res Function(_$ExtendedScanEntryEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExtendedScanEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? localPath = null,
    Object? remotePath = null,
    Object? folder = null,
    Object? category = null,
  }) {
    return _then(_$ExtendedScanEntryEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      localPath: null == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String,
      remotePath: null == remotePath
          ? _value.remotePath
          : remotePath // ignore: cast_nullable_to_non_nullable
              as String,
      folder: null == folder
          ? _value.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as FolderEntity,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryEntity,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$ExtendedScanEntryEntityImpl implements _ExtendedScanEntryEntity {
  const _$ExtendedScanEntryEntityImpl(
      {required this.id,
      required this.localPath,
      required this.remotePath,
      required this.folder,
      required this.category});

  factory _$ExtendedScanEntryEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtendedScanEntryEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String localPath;
  @override
  final String remotePath;
  @override
  final FolderEntity folder;
  @override
  final CategoryEntity category;

  @override
  String toString() {
    return 'ExtendedScanEntryEntity(id: $id, localPath: $localPath, remotePath: $remotePath, folder: $folder, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtendedScanEntryEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath) &&
            (identical(other.remotePath, remotePath) ||
                other.remotePath == remotePath) &&
            (identical(other.folder, folder) || other.folder == folder) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, localPath, remotePath, folder, category);

  /// Create a copy of ExtendedScanEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtendedScanEntryEntityImplCopyWith<_$ExtendedScanEntryEntityImpl>
      get copyWith => __$$ExtendedScanEntryEntityImplCopyWithImpl<
          _$ExtendedScanEntryEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtendedScanEntryEntityImplToJson(
      this,
    );
  }
}

abstract class _ExtendedScanEntryEntity implements ExtendedScanEntryEntity {
  const factory _ExtendedScanEntryEntity(
      {required final String id,
      required final String localPath,
      required final String remotePath,
      required final FolderEntity folder,
      required final CategoryEntity category}) = _$ExtendedScanEntryEntityImpl;

  factory _ExtendedScanEntryEntity.fromJson(Map<String, dynamic> json) =
      _$ExtendedScanEntryEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get localPath;
  @override
  String get remotePath;
  @override
  FolderEntity get folder;
  @override
  CategoryEntity get category;

  /// Create a copy of ExtendedScanEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtendedScanEntryEntityImplCopyWith<_$ExtendedScanEntryEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
