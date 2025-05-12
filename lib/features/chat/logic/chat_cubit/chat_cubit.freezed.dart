// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() chatLoading,
    required TResult Function(T data) chatSuccess,
    required TResult Function(String error) chatFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? chatLoading,
    TResult? Function(T data)? chatSuccess,
    TResult? Function(String error)? chatFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? chatLoading,
    TResult Function(T data)? chatSuccess,
    TResult Function(String error)? chatFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ChatLoading<T> value) chatLoading,
    required TResult Function(ChatSuccess<T> value) chatSuccess,
    required TResult Function(ChatFailure<T> value) chatFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ChatLoading<T> value)? chatLoading,
    TResult? Function(ChatSuccess<T> value)? chatSuccess,
    TResult? Function(ChatFailure<T> value)? chatFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ChatLoading<T> value)? chatLoading,
    TResult Function(ChatSuccess<T> value)? chatSuccess,
    TResult Function(ChatFailure<T> value)? chatFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<T, $Res> {
  factory $ChatStateCopyWith(
          ChatState<T> value, $Res Function(ChatState<T>) then) =
      _$ChatStateCopyWithImpl<T, $Res, ChatState<T>>;
}

/// @nodoc
class _$ChatStateCopyWithImpl<T, $Res, $Val extends ChatState<T>>
    implements $ChatStateCopyWith<T, $Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$ChatStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ChatState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() chatLoading,
    required TResult Function(T data) chatSuccess,
    required TResult Function(String error) chatFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? chatLoading,
    TResult? Function(T data)? chatSuccess,
    TResult? Function(String error)? chatFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? chatLoading,
    TResult Function(T data)? chatSuccess,
    TResult Function(String error)? chatFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ChatLoading<T> value) chatLoading,
    required TResult Function(ChatSuccess<T> value) chatSuccess,
    required TResult Function(ChatFailure<T> value) chatFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ChatLoading<T> value)? chatLoading,
    TResult? Function(ChatSuccess<T> value)? chatSuccess,
    TResult? Function(ChatFailure<T> value)? chatFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ChatLoading<T> value)? chatLoading,
    TResult Function(ChatSuccess<T> value)? chatSuccess,
    TResult Function(ChatFailure<T> value)? chatFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements ChatState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$ChatLoadingImplCopyWith<T, $Res> {
  factory _$$ChatLoadingImplCopyWith(_$ChatLoadingImpl<T> value,
          $Res Function(_$ChatLoadingImpl<T>) then) =
      __$$ChatLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ChatLoadingImplCopyWithImpl<T, $Res>
    extends _$ChatStateCopyWithImpl<T, $Res, _$ChatLoadingImpl<T>>
    implements _$$ChatLoadingImplCopyWith<T, $Res> {
  __$$ChatLoadingImplCopyWithImpl(
      _$ChatLoadingImpl<T> _value, $Res Function(_$ChatLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ChatLoadingImpl<T> implements ChatLoading<T> {
  const _$ChatLoadingImpl();

  @override
  String toString() {
    return 'ChatState<$T>.chatLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() chatLoading,
    required TResult Function(T data) chatSuccess,
    required TResult Function(String error) chatFailure,
  }) {
    return chatLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? chatLoading,
    TResult? Function(T data)? chatSuccess,
    TResult? Function(String error)? chatFailure,
  }) {
    return chatLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? chatLoading,
    TResult Function(T data)? chatSuccess,
    TResult Function(String error)? chatFailure,
    required TResult orElse(),
  }) {
    if (chatLoading != null) {
      return chatLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ChatLoading<T> value) chatLoading,
    required TResult Function(ChatSuccess<T> value) chatSuccess,
    required TResult Function(ChatFailure<T> value) chatFailure,
  }) {
    return chatLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ChatLoading<T> value)? chatLoading,
    TResult? Function(ChatSuccess<T> value)? chatSuccess,
    TResult? Function(ChatFailure<T> value)? chatFailure,
  }) {
    return chatLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ChatLoading<T> value)? chatLoading,
    TResult Function(ChatSuccess<T> value)? chatSuccess,
    TResult Function(ChatFailure<T> value)? chatFailure,
    required TResult orElse(),
  }) {
    if (chatLoading != null) {
      return chatLoading(this);
    }
    return orElse();
  }
}

abstract class ChatLoading<T> implements ChatState<T> {
  const factory ChatLoading() = _$ChatLoadingImpl<T>;
}

/// @nodoc
abstract class _$$ChatSuccessImplCopyWith<T, $Res> {
  factory _$$ChatSuccessImplCopyWith(_$ChatSuccessImpl<T> value,
          $Res Function(_$ChatSuccessImpl<T>) then) =
      __$$ChatSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ChatSuccessImplCopyWithImpl<T, $Res>
    extends _$ChatStateCopyWithImpl<T, $Res, _$ChatSuccessImpl<T>>
    implements _$$ChatSuccessImplCopyWith<T, $Res> {
  __$$ChatSuccessImplCopyWithImpl(
      _$ChatSuccessImpl<T> _value, $Res Function(_$ChatSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ChatSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ChatSuccessImpl<T> implements ChatSuccess<T> {
  const _$ChatSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'ChatState<$T>.chatSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatSuccessImplCopyWith<T, _$ChatSuccessImpl<T>> get copyWith =>
      __$$ChatSuccessImplCopyWithImpl<T, _$ChatSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() chatLoading,
    required TResult Function(T data) chatSuccess,
    required TResult Function(String error) chatFailure,
  }) {
    return chatSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? chatLoading,
    TResult? Function(T data)? chatSuccess,
    TResult? Function(String error)? chatFailure,
  }) {
    return chatSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? chatLoading,
    TResult Function(T data)? chatSuccess,
    TResult Function(String error)? chatFailure,
    required TResult orElse(),
  }) {
    if (chatSuccess != null) {
      return chatSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ChatLoading<T> value) chatLoading,
    required TResult Function(ChatSuccess<T> value) chatSuccess,
    required TResult Function(ChatFailure<T> value) chatFailure,
  }) {
    return chatSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ChatLoading<T> value)? chatLoading,
    TResult? Function(ChatSuccess<T> value)? chatSuccess,
    TResult? Function(ChatFailure<T> value)? chatFailure,
  }) {
    return chatSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ChatLoading<T> value)? chatLoading,
    TResult Function(ChatSuccess<T> value)? chatSuccess,
    TResult Function(ChatFailure<T> value)? chatFailure,
    required TResult orElse(),
  }) {
    if (chatSuccess != null) {
      return chatSuccess(this);
    }
    return orElse();
  }
}

abstract class ChatSuccess<T> implements ChatState<T> {
  const factory ChatSuccess(final T data) = _$ChatSuccessImpl<T>;

  T get data;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatSuccessImplCopyWith<T, _$ChatSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatFailureImplCopyWith<T, $Res> {
  factory _$$ChatFailureImplCopyWith(_$ChatFailureImpl<T> value,
          $Res Function(_$ChatFailureImpl<T>) then) =
      __$$ChatFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ChatFailureImplCopyWithImpl<T, $Res>
    extends _$ChatStateCopyWithImpl<T, $Res, _$ChatFailureImpl<T>>
    implements _$$ChatFailureImplCopyWith<T, $Res> {
  __$$ChatFailureImplCopyWithImpl(
      _$ChatFailureImpl<T> _value, $Res Function(_$ChatFailureImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ChatFailureImpl<T>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChatFailureImpl<T> implements ChatFailure<T> {
  const _$ChatFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'ChatState<$T>.chatFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatFailureImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatFailureImplCopyWith<T, _$ChatFailureImpl<T>> get copyWith =>
      __$$ChatFailureImplCopyWithImpl<T, _$ChatFailureImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() chatLoading,
    required TResult Function(T data) chatSuccess,
    required TResult Function(String error) chatFailure,
  }) {
    return chatFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? chatLoading,
    TResult? Function(T data)? chatSuccess,
    TResult? Function(String error)? chatFailure,
  }) {
    return chatFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? chatLoading,
    TResult Function(T data)? chatSuccess,
    TResult Function(String error)? chatFailure,
    required TResult orElse(),
  }) {
    if (chatFailure != null) {
      return chatFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ChatLoading<T> value) chatLoading,
    required TResult Function(ChatSuccess<T> value) chatSuccess,
    required TResult Function(ChatFailure<T> value) chatFailure,
  }) {
    return chatFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ChatLoading<T> value)? chatLoading,
    TResult? Function(ChatSuccess<T> value)? chatSuccess,
    TResult? Function(ChatFailure<T> value)? chatFailure,
  }) {
    return chatFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ChatLoading<T> value)? chatLoading,
    TResult Function(ChatSuccess<T> value)? chatSuccess,
    TResult Function(ChatFailure<T> value)? chatFailure,
    required TResult orElse(),
  }) {
    if (chatFailure != null) {
      return chatFailure(this);
    }
    return orElse();
  }
}

abstract class ChatFailure<T> implements ChatState<T> {
  const factory ChatFailure(final String error) = _$ChatFailureImpl<T>;

  String get error;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatFailureImplCopyWith<T, _$ChatFailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
