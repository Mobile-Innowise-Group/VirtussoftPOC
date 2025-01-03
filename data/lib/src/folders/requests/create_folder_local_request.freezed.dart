// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_folder_local_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateFolderLocalRequest _$CreateFolderLocalRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateFolderLocalRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateFolderLocalRequest {
  String get name => throw _privateConstructorUsedError;
  int get isPrivate => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  /// Serializes this CreateFolderLocalRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateFolderLocalRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateFolderLocalRequestCopyWith<CreateFolderLocalRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateFolderLocalRequestCopyWith<$Res> {
  factory $CreateFolderLocalRequestCopyWith(CreateFolderLocalRequest value,
          $Res Function(CreateFolderLocalRequest) then) =
      _$CreateFolderLocalRequestCopyWithImpl<$Res, CreateFolderLocalRequest>;
  @useResult
  $Res call({String name, int isPrivate, String id});
}

/// @nodoc
class _$CreateFolderLocalRequestCopyWithImpl<$Res,
        $Val extends CreateFolderLocalRequest>
    implements $CreateFolderLocalRequestCopyWith<$Res> {
  _$CreateFolderLocalRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateFolderLocalRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isPrivate = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateFolderLocalRequestImplCopyWith<$Res>
    implements $CreateFolderLocalRequestCopyWith<$Res> {
  factory _$$CreateFolderLocalRequestImplCopyWith(
          _$CreateFolderLocalRequestImpl value,
          $Res Function(_$CreateFolderLocalRequestImpl) then) =
      __$$CreateFolderLocalRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int isPrivate, String id});
}

/// @nodoc
class __$$CreateFolderLocalRequestImplCopyWithImpl<$Res>
    extends _$CreateFolderLocalRequestCopyWithImpl<$Res,
        _$CreateFolderLocalRequestImpl>
    implements _$$CreateFolderLocalRequestImplCopyWith<$Res> {
  __$$CreateFolderLocalRequestImplCopyWithImpl(
      _$CreateFolderLocalRequestImpl _value,
      $Res Function(_$CreateFolderLocalRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateFolderLocalRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isPrivate = null,
    Object? id = null,
  }) {
    return _then(_$CreateFolderLocalRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFolderLocalRequestImpl implements _CreateFolderLocalRequest {
  const _$CreateFolderLocalRequestImpl(
      {required this.name, required this.isPrivate, required this.id});

  factory _$CreateFolderLocalRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateFolderLocalRequestImplFromJson(json);

  @override
  final String name;
  @override
  final int isPrivate;
  @override
  final String id;

  @override
  String toString() {
    return 'CreateFolderLocalRequest(name: $name, isPrivate: $isPrivate, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFolderLocalRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, isPrivate, id);

  /// Create a copy of CreateFolderLocalRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFolderLocalRequestImplCopyWith<_$CreateFolderLocalRequestImpl>
      get copyWith => __$$CreateFolderLocalRequestImplCopyWithImpl<
          _$CreateFolderLocalRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateFolderLocalRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateFolderLocalRequest implements CreateFolderLocalRequest {
  const factory _CreateFolderLocalRequest(
      {required final String name,
      required final int isPrivate,
      required final String id}) = _$CreateFolderLocalRequestImpl;

  factory _CreateFolderLocalRequest.fromJson(Map<String, dynamic> json) =
      _$CreateFolderLocalRequestImpl.fromJson;

  @override
  String get name;
  @override
  int get isPrivate;
  @override
  String get id;

  /// Create a copy of CreateFolderLocalRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFolderLocalRequestImplCopyWith<_$CreateFolderLocalRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
