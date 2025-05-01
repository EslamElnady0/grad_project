part of 'get_course_materials_cubit.dart';
@freezed
class GetCourseMaterialsState<T> with _$GetCourseMaterialsState {
  const factory GetCourseMaterialsState.initial() = _Initial;
  const factory GetCourseMaterialsState.getCourseMaterialsLoading() = GetCourseMaterialsLoading;
  const factory GetCourseMaterialsState.getCourseMaterialsSuccess(T data) = GetCourseMaterialsSuccess<T>;
  const factory GetCourseMaterialsState.getCourseMaterialsFailure(String error) = GetCourseMaterialsFailure;
}
