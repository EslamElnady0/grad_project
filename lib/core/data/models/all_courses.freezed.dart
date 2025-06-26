// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_courses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AllCourses {
  Object get courses => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TeachersCoursesResponse courses) teacher,
    required TResult Function(StudentsCoursesResponse courses) student,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TeachersCoursesResponse courses)? teacher,
    TResult? Function(StudentsCoursesResponse courses)? student,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TeachersCoursesResponse courses)? teacher,
    TResult Function(StudentsCoursesResponse courses)? student,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Teacher value) teacher,
    required TResult Function(_Student value) student,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Teacher value)? teacher,
    TResult? Function(_Student value)? student,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Teacher value)? teacher,
    TResult Function(_Student value)? student,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllCoursesCopyWith<$Res> {
  factory $AllCoursesCopyWith(
          AllCourses value, $Res Function(AllCourses) then) =
      _$AllCoursesCopyWithImpl<$Res, AllCourses>;
}

/// @nodoc
class _$AllCoursesCopyWithImpl<$Res, $Val extends AllCourses>
    implements $AllCoursesCopyWith<$Res> {
  _$AllCoursesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllCourses
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TeacherImplCopyWith<$Res> {
  factory _$$TeacherImplCopyWith(
          _$TeacherImpl value, $Res Function(_$TeacherImpl) then) =
      __$$TeacherImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TeachersCoursesResponse courses});
}

/// @nodoc
class __$$TeacherImplCopyWithImpl<$Res>
    extends _$AllCoursesCopyWithImpl<$Res, _$TeacherImpl>
    implements _$$TeacherImplCopyWith<$Res> {
  __$$TeacherImplCopyWithImpl(
      _$TeacherImpl _value, $Res Function(_$TeacherImpl) _then)
      : super(_value, _then);

  /// Create a copy of AllCourses
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courses = null,
  }) {
    return _then(_$TeacherImpl(
      null == courses
          ? _value.courses
          : courses // ignore: cast_nullable_to_non_nullable
              as TeachersCoursesResponse,
    ));
  }
}

/// @nodoc

class _$TeacherImpl implements _Teacher {
  const _$TeacherImpl(this.courses);

  @override
  final TeachersCoursesResponse courses;

  @override
  String toString() {
    return 'AllCourses.teacher(courses: $courses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherImpl &&
            (identical(other.courses, courses) || other.courses == courses));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courses);

  /// Create a copy of AllCourses
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherImplCopyWith<_$TeacherImpl> get copyWith =>
      __$$TeacherImplCopyWithImpl<_$TeacherImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TeachersCoursesResponse courses) teacher,
    required TResult Function(StudentsCoursesResponse courses) student,
  }) {
    return teacher(courses);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TeachersCoursesResponse courses)? teacher,
    TResult? Function(StudentsCoursesResponse courses)? student,
  }) {
    return teacher?.call(courses);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TeachersCoursesResponse courses)? teacher,
    TResult Function(StudentsCoursesResponse courses)? student,
    required TResult orElse(),
  }) {
    if (teacher != null) {
      return teacher(courses);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Teacher value) teacher,
    required TResult Function(_Student value) student,
  }) {
    return teacher(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Teacher value)? teacher,
    TResult? Function(_Student value)? student,
  }) {
    return teacher?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Teacher value)? teacher,
    TResult Function(_Student value)? student,
    required TResult orElse(),
  }) {
    if (teacher != null) {
      return teacher(this);
    }
    return orElse();
  }
}

abstract class _Teacher implements AllCourses {
  const factory _Teacher(final TeachersCoursesResponse courses) = _$TeacherImpl;

  @override
  TeachersCoursesResponse get courses;

  /// Create a copy of AllCourses
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherImplCopyWith<_$TeacherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StudentImplCopyWith<$Res> {
  factory _$$StudentImplCopyWith(
          _$StudentImpl value, $Res Function(_$StudentImpl) then) =
      __$$StudentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StudentsCoursesResponse courses});
}

/// @nodoc
class __$$StudentImplCopyWithImpl<$Res>
    extends _$AllCoursesCopyWithImpl<$Res, _$StudentImpl>
    implements _$$StudentImplCopyWith<$Res> {
  __$$StudentImplCopyWithImpl(
      _$StudentImpl _value, $Res Function(_$StudentImpl) _then)
      : super(_value, _then);

  /// Create a copy of AllCourses
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courses = null,
  }) {
    return _then(_$StudentImpl(
      null == courses
          ? _value.courses
          : courses // ignore: cast_nullable_to_non_nullable
              as StudentsCoursesResponse,
    ));
  }
}

/// @nodoc

class _$StudentImpl implements _Student {
  const _$StudentImpl(this.courses);

  @override
  final StudentsCoursesResponse courses;

  @override
  String toString() {
    return 'AllCourses.student(courses: $courses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentImpl &&
            (identical(other.courses, courses) || other.courses == courses));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courses);

  /// Create a copy of AllCourses
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentImplCopyWith<_$StudentImpl> get copyWith =>
      __$$StudentImplCopyWithImpl<_$StudentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TeachersCoursesResponse courses) teacher,
    required TResult Function(StudentsCoursesResponse courses) student,
  }) {
    return student(courses);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TeachersCoursesResponse courses)? teacher,
    TResult? Function(StudentsCoursesResponse courses)? student,
  }) {
    return student?.call(courses);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TeachersCoursesResponse courses)? teacher,
    TResult Function(StudentsCoursesResponse courses)? student,
    required TResult orElse(),
  }) {
    if (student != null) {
      return student(courses);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Teacher value) teacher,
    required TResult Function(_Student value) student,
  }) {
    return student(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Teacher value)? teacher,
    TResult? Function(_Student value)? student,
  }) {
    return student?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Teacher value)? teacher,
    TResult Function(_Student value)? student,
    required TResult orElse(),
  }) {
    if (student != null) {
      return student(this);
    }
    return orElse();
  }
}

abstract class _Student implements AllCourses {
  const factory _Student(final StudentsCoursesResponse courses) = _$StudentImpl;

  @override
  StudentsCoursesResponse get courses;

  /// Create a copy of AllCourses
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentImplCopyWith<_$StudentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
