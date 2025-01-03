// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_entry_entiry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScanEntryEntity _$ScanEntryEntityFromJson(Map<String, dynamic> json) {
  return _ScanEntryEntity.fromJson(json);
}

/// @nodoc
mixin _$ScanEntryEntity {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'local_path')
  String get localPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'remote_path')
  String get remotePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'folder_id')
  String get folderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  String get categoryId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScanEntryEntityCopyWith<ScanEntryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanEntryEntityCopyWith<$Res> {
  factory $ScanEntryEntityCopyWith(
          ScanEntryEntity value, $Res Function(ScanEntryEntity) then) =
      _$ScanEntryEntityCopyWithImpl<$Res, ScanEntryEntity>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'local_path') String localPath,
      @JsonKey(name: 'remote_path') String remotePath,
      @JsonKey(name: 'folder_id') String folderId,
      @JsonKey(name: 'category_id') String categoryId});
}

/// @nodoc
class _$ScanEntryEntityCopyWithImpl<$Res, $Val extends ScanEntryEntity>
    implements $ScanEntryEntityCopyWith<$Res> {
  _$ScanEntryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? localPath = null,
    Object? remotePath = null,
    Object? folderId = null,
    Object? categoryId = null,
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
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScanEntryEntityImplCopyWith<$Res>
    implements $ScanEntryEntityCopyWith<$Res> {
  factory _$$ScanEntryEntityImplCopyWith(_$ScanEntryEntityImpl value,
          $Res Function(_$ScanEntryEntityImpl) then) =
      __$$ScanEntryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'local_path') String localPath,
      @JsonKey(name: 'remote_path') String remotePath,
      @JsonKey(name: 'folder_id') String folderId,
      @JsonKey(name: 'category_id') String categoryId});
}

/// @nodoc
class __$$ScanEntryEntityImplCopyWithImpl<$Res>
    extends _$ScanEntryEntityCopyWithImpl<$Res, _$ScanEntryEntityImpl>
    implements _$$ScanEntryEntityImplCopyWith<$Res> {
  __$$ScanEntryEntityImplCopyWithImpl(
      _$ScanEntryEntityImpl _value, $Res Function(_$ScanEntryEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? localPath = null,
    Object? remotePath = null,
    Object? folderId = null,
    Object? categoryId = null,
  }) {
    return _then(_$ScanEntryEntityImpl(
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
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScanEntryEntityImpl implements _ScanEntryEntity {
  const _$ScanEntryEntityImpl(
      {required this.id,
      @JsonKey(name: 'local_path') required this.localPath,
      @JsonKey(name: 'remote_path') required this.remotePath,
      @JsonKey(name: 'folder_id') required this.folderId,
      @JsonKey(name: 'category_id') required this.categoryId});

  factory _$ScanEntryEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScanEntryEntityImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'local_path')
  final String localPath;
  @override
  @JsonKey(name: 'remote_path')
  final String remotePath;
  @override
  @JsonKey(name: 'folder_id')
  final String folderId;
  @override
  @JsonKey(name: 'category_id')
  final String categoryId;

  @override
  String toString() {
    return 'ScanEntryEntity(id: $id, localPath: $localPath, remotePath: $remotePath, folderId: $folderId, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanEntryEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath) &&
            (identical(other.remotePath, remotePath) ||
                other.remotePath == remotePath) &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, localPath, remotePath, folderId, categoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanEntryEntityImplCopyWith<_$ScanEntryEntityImpl> get copyWith =>
      __$$ScanEntryEntityImplCopyWithImpl<_$ScanEntryEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScanEntryEntityImplToJson(
      this,
    );
  }
}

abstract class _ScanEntryEntity implements ScanEntryEntity {
  const factory _ScanEntryEntity(
          {required final String id,
          @JsonKey(name: 'local_path') required final String localPath,
          @JsonKey(name: 'remote_path') required final String remotePath,
          @JsonKey(name: 'folder_id') required final String folderId,
          @JsonKey(name: 'category_id') required final String categoryId}) =
      _$ScanEntryEntityImpl;

  factory _ScanEntryEntity.fromJson(Map<String, dynamic> json) =
      _$ScanEntryEntityImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'local_path')
  String get localPath;
  @override
  @JsonKey(name: 'remote_path')
  String get remotePath;
  @override
  @JsonKey(name: 'folder_id')
  String get folderId;
  @override
  @JsonKey(name: 'category_id')
  String get categoryId;
  @override
  @JsonKey(ignore: true)
  _$$ScanEntryEntityImplCopyWith<_$ScanEntryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
