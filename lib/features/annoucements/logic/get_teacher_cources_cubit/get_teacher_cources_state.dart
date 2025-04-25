part of 'get_teacher_cources_cubit.dart';
@freezed
class GetTeacherCourcesState<T> with _$GetTeacherCourcesState {
  const factory GetTeacherCourcesState.initial() = _Initial;
  const factory GetTeacherCourcesState.getTeacherCourcesLoading() = GetTeacherCourcesLoading;
  const factory GetTeacherCourcesState.getTeacherCourcesSuccess(T data) = GetTeacherCourcesSuccess<T>;
  const factory GetTeacherCourcesState.getTeacherCourcesFailure(String error) = GetTeacherCourcesFailure;
}
