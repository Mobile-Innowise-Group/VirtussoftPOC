// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FolderEntity _$FolderEntityFromJson(Map<String, dynamic> json) {
  return _FolderEntity.fromJson(json);
}

/// @nodoc
mixin _$FolderEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isPrivate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FolderEntityCopyWith<FolderEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderEntityCopyWith<$Res> {
  factory $FolderEntityCopyWith(
          FolderEntity value, $Res Function(FolderEntity) then) =
      _$FolderEntityCopyWithImpl<$Res, FolderEntity>;
  @useResult
  $Res call({String id, String name, bool isPrivate});
}

/// @nodoc
class _$FolderEntityCopyWithImpl<$Res, $Val extends FolderEntity>
    implements $FolderEntityCopyWith<$Res> {
  _$FolderEntityCopyWithImpl(this._value, this._then);

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
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FolderEntityImplCopyWith<$Res>
    implements $FolderEntityCopyWith<$Res> {
  factory _$$FolderEntityImplCopyWith(
          _$FolderEntityImpl value, $Res Function(_$FolderEntityImpl) then) =
      __$$FolderEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, bool isPrivate});
}

/// @nodoc
class __$$FolderEntityImplCopyWithImpl<$Res>
    extends _$FolderEntityCopyWithImpl<$Res, _$FolderEntityImpl>
    implements _$$FolderEntityImplCopyWith<$Res> {
  __$$FolderEntityImplCopyWithImpl(
      _$FolderEntityImpl _value, $Res Function(_$FolderEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isPrivate = null,
  }) {
    return _then(_$FolderEntityImpl(
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
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FolderEntityImpl implements _FolderEntity {
  const _$FolderEntityImpl(
      {required this.id, required this.name, required this.isPrivate});

  factory _$FolderEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$FolderEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final bool isPrivate;

  @override
  String toString() {
    return 'FolderEntity(id: $id, name: $name, isPrivate: $isPrivate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderEntityImpl &&
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
  _$$FolderEntityImplCopyWith<_$FolderEntityImpl> get copyWith =>
      __$$FolderEntityImplCopyWithImpl<_$FolderEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FolderEntityImplToJson(
      this,
    );
  }
}

abstract class _FolderEntity implements FolderEntity {
  const factory _FolderEntity(
      {required final String id,
      required final String name,
      required final bool isPrivate}) = _$FolderEntityImpl;

  factory _FolderEntity.fromJson(Map<String, dynamic> json) =
      _$FolderEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get isPrivate;
  @override
  @JsonKey(ignore: true)
  _$$FolderEntityImplCopyWith<_$FolderEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
