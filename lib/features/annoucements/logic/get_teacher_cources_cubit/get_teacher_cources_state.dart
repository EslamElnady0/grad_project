part of 'get_teacher_cources_cubit.dart';

@freezed
class GetCourcesToFilterState<T> with _$GetCourcesToFilterState {
  const factory GetCourcesToFilterState.initial() = _Initial;
  const factory GetCourcesToFilterState.getCourcesToFilterLoading() =
      GetCourcesToFilterLoading;
  const factory GetCourcesToFilterState.getCourcesToFilterSuccess(T data) =
      GetCourcesToFilterSuccess<T>;
  const factory GetCourcesToFilterState.getCourcesToFilterFailure(
      String error) = GetCourcesToFilterFailure;
}
