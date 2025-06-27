part of 'delete_course_material_cubit.dart';

@freezed
class DeleteCourseMaterialState with _$DeleteCourseMaterialState {
  const factory DeleteCourseMaterialState.initial() = DeleteCourseInitial;
  const factory DeleteCourseMaterialState.deleteLoading() = DeleteCourseLoading;
  const factory DeleteCourseMaterialState.deleteSuccess() = DeleteCourseSuccess;
  const factory DeleteCourseMaterialState.deleteFailure(String error) = DeleteCourseFailure;
}
