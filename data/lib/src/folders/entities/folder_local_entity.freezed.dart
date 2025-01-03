// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_local_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FolderLocalEntity _$FolderLocalEntityFromJson(Map<String, dynamic> json) {
  return _FolderLocalEntity.fromJson(json);
}

/// @nodoc
mixin _$FolderLocalEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get isPrivate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FolderLocalEntityCopyWith<FolderLocalEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderLocalEntityCopyWith<$Res> {
  factory $FolderLocalEntityCopyWith(
          FolderLocalEntity value, $Res Function(FolderLocalEntity) then) =
      _$FolderLocalEntityCopyWithImpl<$Res, FolderLocalEntity>;
  @useResult
  $Res call({String id, String name, int isPrivate});
}

/// @nodoc
class _$FolderLocalEntityCopyWithImpl<$Res, $Val extends FolderLocalEntity>
    implements $FolderLocalEntityCopyWith<$Res> {
  _$FolderLocalEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isPrivate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FolderLocalEntityImplCopyWith<$Res>
    implements $FolderLocalEntityCopyWith<$Res> {
  factory _$$FolderLocalEntityImplCopyWith(_$FolderLocalEntityImpl value,
          $Res Function(_$FolderLocalEntityImpl) then) =
      __$$FolderLocalEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, int isPrivate});
}

/// @nodoc
class __$$FolderLocalEntityImplCopyWithImpl<$Res>
    extends _$FolderLocalEntityCopyWithImpl<$Res, _$FolderLocalEntityImpl>
    implements _$$FolderLocalEntityImplCopyWith<$Res> {
  __$$FolderLocalEntityImplCopyWithImpl(_$FolderLocalEntityImpl _value,
      $Res Function(_$FolderLocalEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isPrivate = null,
  }) {
    return _then(_$FolderLocalEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FolderLocalEntityImpl implements _FolderLocalEntity {
  const _$FolderLocalEntityImpl(
      {required this.id, required this.name, required this.isPrivate});

  factory _$FolderLocalEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$FolderLocalEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int isPrivate;

  @override
  String toString() {
    return 'FolderLocalEntity(id: $id, name: $name, isPrivate: $isPrivate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderLocalEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isPrivate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FolderLocalEntityImplCopyWith<_$FolderLocalEntityImpl> get copyWith =>
      __$$FolderLocalEntityImplCopyWithImpl<_$FolderLocalEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FolderLocalEntityImplToJson(
      this,
    );
  }
}

abstract class _FolderLocalEntity implements FolderLocalEntity {
  const factory _FolderLocalEntity(
      {required final String id,
      required final String name,
      required final int isPrivate}) = _$FolderLocalEntityImpl;

  factory _FolderLocalEntity.fromJson(Map<String, dynamic> json) =
      _$FolderLocalEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get isPrivate;
  @override
  @JsonKey(ignore: true)
  _$$FolderLocalEntityImplCopyWith<_$FolderLocalEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
