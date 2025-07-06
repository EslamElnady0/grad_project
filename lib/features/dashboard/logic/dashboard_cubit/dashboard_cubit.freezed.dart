// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() dashboardLoading,
    required TResult Function(T data) dashboardSuccess,
    required TResult Function(String error) dashboardFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? dashboardLoading,
    TResult? Function(T data)? dashboardSuccess,
    TResult? Function(String error)? dashboardFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? dashboardLoading,
    TResult Function(T data)? dashboardSuccess,
    TResult Function(String error)? dashboardFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(DashboardLoading<T> value) dashboardLoading,
    required TResult Function(DashboardSuccess<T> value) dashboardSuccess,
    required TResult Function(DashboardFailure<T> value) dashboardFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(DashboardLoading<T> value)? dashboardLoading,
    TResult? Function(DashboardSuccess<T> value)? dashboardSuccess,
    TResult? Function(DashboardFailure<T> value)? dashboardFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(DashboardLoading<T> value)? dashboardLoading,
    TResult Function(DashboardSuccess<T> value)? dashboardSuccess,
    TResult Function(DashboardFailure<T> value)? dashboardFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<T, $Res> {
  factory $DashboardStateCopyWith(
          DashboardState<T> value, $Res Function(DashboardState<T>) then) =
      _$DashboardStateCopyWithImpl<T, $Res, DashboardState<T>>;
}

/// @nodoc
class _$DashboardStateCopyWithImpl<T, $Res, $Val extends DashboardState<T>>
    implements $DashboardStateCopyWith<T, $Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardState
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
    extends _$DashboardStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'DashboardState<$T>.initial()';
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
    required TResult Function() dashboardLoading,
    required TResult Function(T data) dashboardSuccess,
    required TResult Function(String error) dashboardFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? dashboardLoading,
    TResult? Function(T data)? dashboardSuccess,
    TResult? Function(String error)? dashboardFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? dashboardLoading,
    TResult Function(T data)? dashboardSuccess,
    TResult Function(String error)? dashboardFailure,
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
    required TResult Function(DashboardLoading<T> value) dashboardLoading,
    required TResult Function(DashboardSuccess<T> value) dashboardSuccess,
    required TResult Function(DashboardFailure<T> value) dashboardFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(DashboardLoading<T> value)? dashboardLoading,
    TResult? Function(DashboardSuccess<T> value)? dashboardSuccess,
    TResult? Function(DashboardFailure<T> value)? dashboardFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(DashboardLoading<T> value)? dashboardLoading,
    TResult Function(DashboardSuccess<T> value)? dashboardSuccess,
    TResult Function(DashboardFailure<T> value)? dashboardFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements DashboardState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$DashboardLoadingImplCopyWith<T, $Res> {
  factory _$$DashboardLoadingImplCopyWith(_$DashboardLoadingImpl<T> value,
          $Res Function(_$DashboardLoadingImpl<T>) then) =
      __$$DashboardLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$DashboardLoadingImplCopyWithImpl<T, $Res>
    extends _$DashboardStateCopyWithImpl<T, $Res, _$DashboardLoadingImpl<T>>
    implements _$$DashboardLoadingImplCopyWith<T, $Res> {
  __$$DashboardLoadingImplCopyWithImpl(_$DashboardLoadingImpl<T> _value,
      $Res Function(_$DashboardLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DashboardLoadingImpl<T> implements DashboardLoading<T> {
  const _$DashboardLoadingImpl();

  @override
  String toString() {
    return 'DashboardState<$T>.dashboardLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() dashboardLoading,
    required TResult Function(T data) dashboardSuccess,
    required TResult Function(String error) dashboardFailure,
  }) {
    return dashboardLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? dashboardLoading,
    TResult? Function(T data)? dashboardSuccess,
    TResult? Function(String error)? dashboardFailure,
  }) {
    return dashboardLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? dashboardLoading,
    TResult Function(T data)? dashboardSuccess,
    TResult Function(String error)? dashboardFailure,
    required TResult orElse(),
  }) {
    if (dashboardLoading != null) {
      return dashboardLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(DashboardLoading<T> value) dashboardLoading,
    required TResult Function(DashboardSuccess<T> value) dashboardSuccess,
    required TResult Function(DashboardFailure<T> value) dashboardFailure,
  }) {
    return dashboardLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(DashboardLoading<T> value)? dashboardLoading,
    TResult? Function(DashboardSuccess<T> value)? dashboardSuccess,
    TResult? Function(DashboardFailure<T> value)? dashboardFailure,
  }) {
    return dashboardLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(DashboardLoading<T> value)? dashboardLoading,
    TResult Function(DashboardSuccess<T> value)? dashboardSuccess,
    TResult Function(DashboardFailure<T> value)? dashboardFailure,
    required TResult orElse(),
  }) {
    if (dashboardLoading != null) {
      return dashboardLoading(this);
    }
    return orElse();
  }
}

abstract class DashboardLoading<T> implements DashboardState<T> {
  const factory DashboardLoading() = _$DashboardLoadingImpl<T>;
}

/// @nodoc
abstract class _$$DashboardSuccessImplCopyWith<T, $Res> {
  factory _$$DashboardSuccessImplCopyWith(_$DashboardSuccessImpl<T> value,
          $Res Function(_$DashboardSuccessImpl<T>) then) =
      __$$DashboardSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$DashboardSuccessImplCopyWithImpl<T, $Res>
    extends _$DashboardStateCopyWithImpl<T, $Res, _$DashboardSuccessImpl<T>>
    implements _$$DashboardSuccessImplCopyWith<T, $Res> {
  __$$DashboardSuccessImplCopyWithImpl(_$DashboardSuccessImpl<T> _value,
      $Res Function(_$DashboardSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$DashboardSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$DashboardSuccessImpl<T> implements DashboardSuccess<T> {
  const _$DashboardSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'DashboardState<$T>.dashboardSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardSuccessImplCopyWith<T, _$DashboardSuccessImpl<T>> get copyWith =>
      __$$DashboardSuccessImplCopyWithImpl<T, _$DashboardSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() dashboardLoading,
    required TResult Function(T data) dashboardSuccess,
    required TResult Function(String error) dashboardFailure,
  }) {
    return dashboardSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? dashboardLoading,
    TResult? Function(T data)? dashboardSuccess,
    TResult? Function(String error)? dashboardFailure,
  }) {
    return dashboardSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? dashboardLoading,
    TResult Function(T data)? dashboardSuccess,
    TResult Function(String error)? dashboardFailure,
    required TResult orElse(),
  }) {
    if (dashboardSuccess != null) {
      return dashboardSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(DashboardLoading<T> value) dashboardLoading,
    required TResult Function(DashboardSuccess<T> value) dashboardSuccess,
    required TResult Function(DashboardFailure<T> value) dashboardFailure,
  }) {
    return dashboardSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(DashboardLoading<T> value)? dashboardLoading,
    TResult? Function(DashboardSuccess<T> value)? dashboardSuccess,
    TResult? Function(DashboardFailure<T> value)? dashboardFailure,
  }) {
    return dashboardSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(DashboardLoading<T> value)? dashboardLoading,
    TResult Function(DashboardSuccess<T> value)? dashboardSuccess,
    TResult Function(DashboardFailure<T> value)? dashboardFailure,
    required TResult orElse(),
  }) {
    if (dashboardSuccess != null) {
      return dashboardSuccess(this);
    }
    return orElse();
  }
}

abstract class DashboardSuccess<T> implements DashboardState<T> {
  const factory DashboardSuccess(final T data) = _$DashboardSuccessImpl<T>;

  T get data;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardSuccessImplCopyWith<T, _$DashboardSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DashboardFailureImplCopyWith<T, $Res> {
  factory _$$DashboardFailureImplCopyWith(_$DashboardFailureImpl<T> value,
          $Res Function(_$DashboardFailureImpl<T>) then) =
      __$$DashboardFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$DashboardFailureImplCopyWithImpl<T, $Res>
    extends _$DashboardStateCopyWithImpl<T, $Res, _$DashboardFailureImpl<T>>
    implements _$$DashboardFailureImplCopyWith<T, $Res> {
  __$$DashboardFailureImplCopyWithImpl(_$DashboardFailureImpl<T> _value,
      $Res Function(_$DashboardFailureImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$DashboardFailureImpl<T>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DashboardFailureImpl<T> implements DashboardFailure<T> {
  const _$DashboardFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'DashboardState<$T>.dashboardFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardFailureImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardFailureImplCopyWith<T, _$DashboardFailureImpl<T>> get copyWith =>
      __$$DashboardFailureImplCopyWithImpl<T, _$DashboardFailureImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() dashboardLoading,
    required TResult Function(T data) dashboardSuccess,
    required TResult Function(String error) dashboardFailure,
  }) {
    return dashboardFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? dashboardLoading,
    TResult? Function(T data)? dashboardSuccess,
    TResult? Function(String error)? dashboardFailure,
  }) {
    return dashboardFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? dashboardLoading,
    TResult Function(T data)? dashboardSuccess,
    TResult Function(String error)? dashboardFailure,
    required TResult orElse(),
  }) {
    if (dashboardFailure != null) {
      return dashboardFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(DashboardLoading<T> value) dashboardLoading,
    required TResult Function(DashboardSuccess<T> value) dashboardSuccess,
    required TResult Function(DashboardFailure<T> value) dashboardFailure,
  }) {
    return dashboardFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(DashboardLoading<T> value)? dashboardLoading,
    TResult? Function(DashboardSuccess<T> value)? dashboardSuccess,
    TResult? Function(DashboardFailure<T> value)? dashboardFailure,
  }) {
    return dashboardFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(DashboardLoading<T> value)? dashboardLoading,
    TResult Function(DashboardSuccess<T> value)? dashboardSuccess,
    TResult Function(DashboardFailure<T> value)? dashboardFailure,
    required TResult orElse(),
  }) {
    if (dashboardFailure != null) {
      return dashboardFailure(this);
    }
    return orElse();
  }
}

abstract class DashboardFailure<T> implements DashboardState<T> {
  const factory DashboardFailure(final String error) =
      _$DashboardFailureImpl<T>;

  String get error;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardFailureImplCopyWith<T, _$DashboardFailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
