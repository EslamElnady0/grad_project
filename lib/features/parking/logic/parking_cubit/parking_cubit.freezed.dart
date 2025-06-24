// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parking_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ParkingState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() parkingLoading,
    required TResult Function(T data) parkingSuccess,
    required TResult Function(String error) parkingFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? parkingLoading,
    TResult? Function(T data)? parkingSuccess,
    TResult? Function(String error)? parkingFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? parkingLoading,
    TResult Function(T data)? parkingSuccess,
    TResult Function(String error)? parkingFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ParkingLoading<T> value) parkingLoading,
    required TResult Function(ParkingSuccess<T> value) parkingSuccess,
    required TResult Function(ParkingFailure<T> value) parkingFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ParkingLoading<T> value)? parkingLoading,
    TResult? Function(ParkingSuccess<T> value)? parkingSuccess,
    TResult? Function(ParkingFailure<T> value)? parkingFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ParkingLoading<T> value)? parkingLoading,
    TResult Function(ParkingSuccess<T> value)? parkingSuccess,
    TResult Function(ParkingFailure<T> value)? parkingFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParkingStateCopyWith<T, $Res> {
  factory $ParkingStateCopyWith(
          ParkingState<T> value, $Res Function(ParkingState<T>) then) =
      _$ParkingStateCopyWithImpl<T, $Res, ParkingState<T>>;
}

/// @nodoc
class _$ParkingStateCopyWithImpl<T, $Res, $Val extends ParkingState<T>>
    implements $ParkingStateCopyWith<T, $Res> {
  _$ParkingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParkingState
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
    extends _$ParkingStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ParkingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ParkingState<$T>.initial()';
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
    required TResult Function() parkingLoading,
    required TResult Function(T data) parkingSuccess,
    required TResult Function(String error) parkingFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? parkingLoading,
    TResult? Function(T data)? parkingSuccess,
    TResult? Function(String error)? parkingFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? parkingLoading,
    TResult Function(T data)? parkingSuccess,
    TResult Function(String error)? parkingFailure,
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
    required TResult Function(ParkingLoading<T> value) parkingLoading,
    required TResult Function(ParkingSuccess<T> value) parkingSuccess,
    required TResult Function(ParkingFailure<T> value) parkingFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ParkingLoading<T> value)? parkingLoading,
    TResult? Function(ParkingSuccess<T> value)? parkingSuccess,
    TResult? Function(ParkingFailure<T> value)? parkingFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ParkingLoading<T> value)? parkingLoading,
    TResult Function(ParkingSuccess<T> value)? parkingSuccess,
    TResult Function(ParkingFailure<T> value)? parkingFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements ParkingState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$ParkingLoadingImplCopyWith<T, $Res> {
  factory _$$ParkingLoadingImplCopyWith(_$ParkingLoadingImpl<T> value,
          $Res Function(_$ParkingLoadingImpl<T>) then) =
      __$$ParkingLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ParkingLoadingImplCopyWithImpl<T, $Res>
    extends _$ParkingStateCopyWithImpl<T, $Res, _$ParkingLoadingImpl<T>>
    implements _$$ParkingLoadingImplCopyWith<T, $Res> {
  __$$ParkingLoadingImplCopyWithImpl(_$ParkingLoadingImpl<T> _value,
      $Res Function(_$ParkingLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ParkingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ParkingLoadingImpl<T> implements ParkingLoading<T> {
  const _$ParkingLoadingImpl();

  @override
  String toString() {
    return 'ParkingState<$T>.parkingLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ParkingLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() parkingLoading,
    required TResult Function(T data) parkingSuccess,
    required TResult Function(String error) parkingFailure,
  }) {
    return parkingLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? parkingLoading,
    TResult? Function(T data)? parkingSuccess,
    TResult? Function(String error)? parkingFailure,
  }) {
    return parkingLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? parkingLoading,
    TResult Function(T data)? parkingSuccess,
    TResult Function(String error)? parkingFailure,
    required TResult orElse(),
  }) {
    if (parkingLoading != null) {
      return parkingLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ParkingLoading<T> value) parkingLoading,
    required TResult Function(ParkingSuccess<T> value) parkingSuccess,
    required TResult Function(ParkingFailure<T> value) parkingFailure,
  }) {
    return parkingLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ParkingLoading<T> value)? parkingLoading,
    TResult? Function(ParkingSuccess<T> value)? parkingSuccess,
    TResult? Function(ParkingFailure<T> value)? parkingFailure,
  }) {
    return parkingLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ParkingLoading<T> value)? parkingLoading,
    TResult Function(ParkingSuccess<T> value)? parkingSuccess,
    TResult Function(ParkingFailure<T> value)? parkingFailure,
    required TResult orElse(),
  }) {
    if (parkingLoading != null) {
      return parkingLoading(this);
    }
    return orElse();
  }
}

abstract class ParkingLoading<T> implements ParkingState<T> {
  const factory ParkingLoading() = _$ParkingLoadingImpl<T>;
}

/// @nodoc
abstract class _$$ParkingSuccessImplCopyWith<T, $Res> {
  factory _$$ParkingSuccessImplCopyWith(_$ParkingSuccessImpl<T> value,
          $Res Function(_$ParkingSuccessImpl<T>) then) =
      __$$ParkingSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ParkingSuccessImplCopyWithImpl<T, $Res>
    extends _$ParkingStateCopyWithImpl<T, $Res, _$ParkingSuccessImpl<T>>
    implements _$$ParkingSuccessImplCopyWith<T, $Res> {
  __$$ParkingSuccessImplCopyWithImpl(_$ParkingSuccessImpl<T> _value,
      $Res Function(_$ParkingSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ParkingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ParkingSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ParkingSuccessImpl<T> implements ParkingSuccess<T> {
  const _$ParkingSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'ParkingState<$T>.parkingSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParkingSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of ParkingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParkingSuccessImplCopyWith<T, _$ParkingSuccessImpl<T>> get copyWith =>
      __$$ParkingSuccessImplCopyWithImpl<T, _$ParkingSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() parkingLoading,
    required TResult Function(T data) parkingSuccess,
    required TResult Function(String error) parkingFailure,
  }) {
    return parkingSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? parkingLoading,
    TResult? Function(T data)? parkingSuccess,
    TResult? Function(String error)? parkingFailure,
  }) {
    return parkingSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? parkingLoading,
    TResult Function(T data)? parkingSuccess,
    TResult Function(String error)? parkingFailure,
    required TResult orElse(),
  }) {
    if (parkingSuccess != null) {
      return parkingSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ParkingLoading<T> value) parkingLoading,
    required TResult Function(ParkingSuccess<T> value) parkingSuccess,
    required TResult Function(ParkingFailure<T> value) parkingFailure,
  }) {
    return parkingSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ParkingLoading<T> value)? parkingLoading,
    TResult? Function(ParkingSuccess<T> value)? parkingSuccess,
    TResult? Function(ParkingFailure<T> value)? parkingFailure,
  }) {
    return parkingSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ParkingLoading<T> value)? parkingLoading,
    TResult Function(ParkingSuccess<T> value)? parkingSuccess,
    TResult Function(ParkingFailure<T> value)? parkingFailure,
    required TResult orElse(),
  }) {
    if (parkingSuccess != null) {
      return parkingSuccess(this);
    }
    return orElse();
  }
}

abstract class ParkingSuccess<T> implements ParkingState<T> {
  const factory ParkingSuccess(final T data) = _$ParkingSuccessImpl<T>;

  T get data;

  /// Create a copy of ParkingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParkingSuccessImplCopyWith<T, _$ParkingSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParkingFailureImplCopyWith<T, $Res> {
  factory _$$ParkingFailureImplCopyWith(_$ParkingFailureImpl<T> value,
          $Res Function(_$ParkingFailureImpl<T>) then) =
      __$$ParkingFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ParkingFailureImplCopyWithImpl<T, $Res>
    extends _$ParkingStateCopyWithImpl<T, $Res, _$ParkingFailureImpl<T>>
    implements _$$ParkingFailureImplCopyWith<T, $Res> {
  __$$ParkingFailureImplCopyWithImpl(_$ParkingFailureImpl<T> _value,
      $Res Function(_$ParkingFailureImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ParkingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ParkingFailureImpl<T>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ParkingFailureImpl<T> implements ParkingFailure<T> {
  const _$ParkingFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'ParkingState<$T>.parkingFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParkingFailureImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ParkingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParkingFailureImplCopyWith<T, _$ParkingFailureImpl<T>> get copyWith =>
      __$$ParkingFailureImplCopyWithImpl<T, _$ParkingFailureImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() parkingLoading,
    required TResult Function(T data) parkingSuccess,
    required TResult Function(String error) parkingFailure,
  }) {
    return parkingFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? parkingLoading,
    TResult? Function(T data)? parkingSuccess,
    TResult? Function(String error)? parkingFailure,
  }) {
    return parkingFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? parkingLoading,
    TResult Function(T data)? parkingSuccess,
    TResult Function(String error)? parkingFailure,
    required TResult orElse(),
  }) {
    if (parkingFailure != null) {
      return parkingFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ParkingLoading<T> value) parkingLoading,
    required TResult Function(ParkingSuccess<T> value) parkingSuccess,
    required TResult Function(ParkingFailure<T> value) parkingFailure,
  }) {
    return parkingFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ParkingLoading<T> value)? parkingLoading,
    TResult? Function(ParkingSuccess<T> value)? parkingSuccess,
    TResult? Function(ParkingFailure<T> value)? parkingFailure,
  }) {
    return parkingFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ParkingLoading<T> value)? parkingLoading,
    TResult Function(ParkingSuccess<T> value)? parkingSuccess,
    TResult Function(ParkingFailure<T> value)? parkingFailure,
    required TResult orElse(),
  }) {
    if (parkingFailure != null) {
      return parkingFailure(this);
    }
    return orElse();
  }
}

abstract class ParkingFailure<T> implements ParkingState<T> {
  const factory ParkingFailure(final String error) = _$ParkingFailureImpl<T>;

  String get error;

  /// Create a copy of ParkingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParkingFailureImplCopyWith<T, _$ParkingFailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
