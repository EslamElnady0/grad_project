// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assign_grade_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AssignGradeState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int answerId, int newDegree, T data) success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int answerId, int newDegree, T data)? success,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int answerId, int newDegree, T data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(AssignGradeLoading<T> value) loading,
    required TResult Function(AssignGradeSuccess<T> value) success,
    required TResult Function(AssignGradeFailure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(AssignGradeLoading<T> value)? loading,
    TResult? Function(AssignGradeSuccess<T> value)? success,
    TResult? Function(AssignGradeFailure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(AssignGradeLoading<T> value)? loading,
    TResult Function(AssignGradeSuccess<T> value)? success,
    TResult Function(AssignGradeFailure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignGradeStateCopyWith<T, $Res> {
  factory $AssignGradeStateCopyWith(
          AssignGradeState<T> value, $Res Function(AssignGradeState<T>) then) =
      _$AssignGradeStateCopyWithImpl<T, $Res, AssignGradeState<T>>;
}

/// @nodoc
class _$AssignGradeStateCopyWithImpl<T, $Res, $Val extends AssignGradeState<T>>
    implements $AssignGradeStateCopyWith<T, $Res> {
  _$AssignGradeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssignGradeState
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
    extends _$AssignGradeStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AssignGradeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AssignGradeState<$T>.initial()';
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
    required TResult Function() loading,
    required TResult Function(int answerId, int newDegree, T data) success,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int answerId, int newDegree, T data)? success,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int answerId, int newDegree, T data)? success,
    TResult Function(String message)? failure,
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
    required TResult Function(AssignGradeLoading<T> value) loading,
    required TResult Function(AssignGradeSuccess<T> value) success,
    required TResult Function(AssignGradeFailure<T> value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(AssignGradeLoading<T> value)? loading,
    TResult? Function(AssignGradeSuccess<T> value)? success,
    TResult? Function(AssignGradeFailure<T> value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(AssignGradeLoading<T> value)? loading,
    TResult Function(AssignGradeSuccess<T> value)? success,
    TResult Function(AssignGradeFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements AssignGradeState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$AssignGradeLoadingImplCopyWith<T, $Res> {
  factory _$$AssignGradeLoadingImplCopyWith(_$AssignGradeLoadingImpl<T> value,
          $Res Function(_$AssignGradeLoadingImpl<T>) then) =
      __$$AssignGradeLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$AssignGradeLoadingImplCopyWithImpl<T, $Res>
    extends _$AssignGradeStateCopyWithImpl<T, $Res, _$AssignGradeLoadingImpl<T>>
    implements _$$AssignGradeLoadingImplCopyWith<T, $Res> {
  __$$AssignGradeLoadingImplCopyWithImpl(_$AssignGradeLoadingImpl<T> _value,
      $Res Function(_$AssignGradeLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AssignGradeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AssignGradeLoadingImpl<T> implements AssignGradeLoading<T> {
  const _$AssignGradeLoadingImpl();

  @override
  String toString() {
    return 'AssignGradeState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignGradeLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int answerId, int newDegree, T data) success,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int answerId, int newDegree, T data)? success,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int answerId, int newDegree, T data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(AssignGradeLoading<T> value) loading,
    required TResult Function(AssignGradeSuccess<T> value) success,
    required TResult Function(AssignGradeFailure<T> value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(AssignGradeLoading<T> value)? loading,
    TResult? Function(AssignGradeSuccess<T> value)? success,
    TResult? Function(AssignGradeFailure<T> value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(AssignGradeLoading<T> value)? loading,
    TResult Function(AssignGradeSuccess<T> value)? success,
    TResult Function(AssignGradeFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AssignGradeLoading<T> implements AssignGradeState<T> {
  const factory AssignGradeLoading() = _$AssignGradeLoadingImpl<T>;
}

/// @nodoc
abstract class _$$AssignGradeSuccessImplCopyWith<T, $Res> {
  factory _$$AssignGradeSuccessImplCopyWith(_$AssignGradeSuccessImpl<T> value,
          $Res Function(_$AssignGradeSuccessImpl<T>) then) =
      __$$AssignGradeSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({int answerId, int newDegree, T data});
}

/// @nodoc
class __$$AssignGradeSuccessImplCopyWithImpl<T, $Res>
    extends _$AssignGradeStateCopyWithImpl<T, $Res, _$AssignGradeSuccessImpl<T>>
    implements _$$AssignGradeSuccessImplCopyWith<T, $Res> {
  __$$AssignGradeSuccessImplCopyWithImpl(_$AssignGradeSuccessImpl<T> _value,
      $Res Function(_$AssignGradeSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AssignGradeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerId = null,
    Object? newDegree = null,
    Object? data = freezed,
  }) {
    return _then(_$AssignGradeSuccessImpl<T>(
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as int,
      newDegree: null == newDegree
          ? _value.newDegree
          : newDegree // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$AssignGradeSuccessImpl<T> implements AssignGradeSuccess<T> {
  const _$AssignGradeSuccessImpl(
      {required this.answerId, required this.newDegree, required this.data});

  @override
  final int answerId;
  @override
  final int newDegree;
  @override
  final T data;

  @override
  String toString() {
    return 'AssignGradeState<$T>.success(answerId: $answerId, newDegree: $newDegree, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignGradeSuccessImpl<T> &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId) &&
            (identical(other.newDegree, newDegree) ||
                other.newDegree == newDegree) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, answerId, newDegree,
      const DeepCollectionEquality().hash(data));

  /// Create a copy of AssignGradeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignGradeSuccessImplCopyWith<T, _$AssignGradeSuccessImpl<T>>
      get copyWith => __$$AssignGradeSuccessImplCopyWithImpl<T,
          _$AssignGradeSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int answerId, int newDegree, T data) success,
    required TResult Function(String message) failure,
  }) {
    return success(answerId, newDegree, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int answerId, int newDegree, T data)? success,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(answerId, newDegree, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int answerId, int newDegree, T data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(answerId, newDegree, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(AssignGradeLoading<T> value) loading,
    required TResult Function(AssignGradeSuccess<T> value) success,
    required TResult Function(AssignGradeFailure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(AssignGradeLoading<T> value)? loading,
    TResult? Function(AssignGradeSuccess<T> value)? success,
    TResult? Function(AssignGradeFailure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(AssignGradeLoading<T> value)? loading,
    TResult Function(AssignGradeSuccess<T> value)? success,
    TResult Function(AssignGradeFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AssignGradeSuccess<T> implements AssignGradeState<T> {
  const factory AssignGradeSuccess(
      {required final int answerId,
      required final int newDegree,
      required final T data}) = _$AssignGradeSuccessImpl<T>;

  int get answerId;
  int get newDegree;
  T get data;

  /// Create a copy of AssignGradeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssignGradeSuccessImplCopyWith<T, _$AssignGradeSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AssignGradeFailureImplCopyWith<T, $Res> {
  factory _$$AssignGradeFailureImplCopyWith(_$AssignGradeFailureImpl<T> value,
          $Res Function(_$AssignGradeFailureImpl<T>) then) =
      __$$AssignGradeFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AssignGradeFailureImplCopyWithImpl<T, $Res>
    extends _$AssignGradeStateCopyWithImpl<T, $Res, _$AssignGradeFailureImpl<T>>
    implements _$$AssignGradeFailureImplCopyWith<T, $Res> {
  __$$AssignGradeFailureImplCopyWithImpl(_$AssignGradeFailureImpl<T> _value,
      $Res Function(_$AssignGradeFailureImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AssignGradeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AssignGradeFailureImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AssignGradeFailureImpl<T> implements AssignGradeFailure<T> {
  const _$AssignGradeFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AssignGradeState<$T>.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignGradeFailureImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AssignGradeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignGradeFailureImplCopyWith<T, _$AssignGradeFailureImpl<T>>
      get copyWith => __$$AssignGradeFailureImplCopyWithImpl<T,
          _$AssignGradeFailureImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int answerId, int newDegree, T data) success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int answerId, int newDegree, T data)? success,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int answerId, int newDegree, T data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(AssignGradeLoading<T> value) loading,
    required TResult Function(AssignGradeSuccess<T> value) success,
    required TResult Function(AssignGradeFailure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(AssignGradeLoading<T> value)? loading,
    TResult? Function(AssignGradeSuccess<T> value)? success,
    TResult? Function(AssignGradeFailure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(AssignGradeLoading<T> value)? loading,
    TResult Function(AssignGradeSuccess<T> value)? success,
    TResult Function(AssignGradeFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class AssignGradeFailure<T> implements AssignGradeState<T> {
  const factory AssignGradeFailure(final String message) =
      _$AssignGradeFailureImpl<T>;

  String get message;

  /// Create a copy of AssignGradeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssignGradeFailureImplCopyWith<T, _$AssignGradeFailureImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
