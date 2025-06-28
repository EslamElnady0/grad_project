part of 'delete_course_material_cubit.dart';

@freezed
class DeleteCourseMaterialState<T> with _$DeleteCourseMaterialState {
  const factory DeleteCourseMaterialState.initial() = _Initial;
  const factory DeleteCourseMaterialState.deleteCourseMaterialLoading() = DeleteCourseMaterialLoading;
  const factory DeleteCourseMaterialState.deleteCourseMaterialSuccess(T data) = DeleteCourseMaterialSuccess<T>;
  const factory DeleteCourseMaterialState.deleteCourseMaterialFailure(String error) = DeleteCourseMaterialFailure;
}
         