part of 'all_courses_cubit.dart';

@freezed
class AllCoursesState<T> with _$AllCoursesState {
  const factory AllCoursesState.initial() = _Initial;
  const factory AllCoursesState.allCoursesLoading() = AllCoursesLoading;
  const factory AllCoursesState.allTeacherCoursesSuccess(
      TeachersCoursesResponse data) = AllTeacherCoursesSuccess<T>;
  const factory AllCoursesState.allStudentCoursesSuccess(
      StudentsCoursesResponse data) = AllStudentCoursesSuccess<T>;
  const factory AllCoursesState.allCoursesFailure(String error) =
      AllCoursesFailure;
}
