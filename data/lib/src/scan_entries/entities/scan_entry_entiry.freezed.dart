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
  String get path => throw _privateConstructorUsedError;
  int get folderId => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;

  /// Serializes this ScanEntryEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScanEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScanEntryEntityCopyWith<ScanEntryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanEntryEntityCopyWith<$Res> {
  factory $ScanEntryEntityCopyWith(
          ScanEntryEntity value, $Res Function(ScanEntryEntity) then) =
      _$ScanEntryEntityCopyWithImpl<$Res, ScanEntryEntity>;
  @useResult
  $Res call({String id, String path, int folderId, int categoryId});
}

/// @nodoc
class _$ScanEntryEntityCopyWithImpl<$Res, $Val extends ScanEntryEntity>
    implements $ScanEntryEntityCopyWith<$Res> {
  _$ScanEntryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScanEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? path = null,
    Object? folderId = null,
    Object? categoryId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({String id, String path, int folderId, int categoryId});
}

/// @nodoc
class __$$ScanEntryEntityImplCopyWithImpl<$Res>
    extends _$ScanEntryEntityCopyWithImpl<$Res, _$ScanEntryEntityImpl>
    implements _$$ScanEntryEntityImplCopyWith<$Res> {
  __$$ScanEntryEntityImplCopyWithImpl(
      _$ScanEntryEntityImpl _value, $Res Function(_$ScanEntryEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScanEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? path = null,
    Object? folderId = null,
    Object? categoryId = null,
  }) {
    return _then(_$ScanEntryEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScanEntryEntityImpl implements _ScanEntryEntity {
  const _$ScanEntryEntityImpl(
      {required this.id,
      required this.path,
      required this.folderId,
      required this.categoryId});

  factory _$ScanEntryEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScanEntryEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String path;
  @override
  final int folderId;
  @override
  final int categoryId;

  @override
  String toString() {
    return 'ScanEntryEntity(id: $id, path: $path, folderId: $folderId, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanEntryEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, path, folderId, categoryId);

  /// Create a copy of ScanEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      required final String path,
      required final int folderId,
      required final int categoryId}) = _$ScanEntryEntityImpl;

  factory _ScanEntryEntity.fromJson(Map<String, dynamic> json) =
      _$ScanEntryEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get path;
  @override
  int get folderId;
  @override
  int get categoryId;

  /// Create a copy of ScanEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScanEntryEntityImplCopyWith<_$ScanEntryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
