part of 'get_buildings_cubit.dart';
@freezed
class GetBuildingsState<T> with _$GetBuildingsState {
  const factory GetBuildingsState.initial() = _Initial;
  const factory GetBuildingsState.getBuildingsLoading() = GetBuildingsLoading;
  const factory GetBuildingsState.getBuildingsSuccess(T data) = GetBuildingsSuccess<T>;
  const factory GetBuildingsState.getBuildingsFailure(String error) = GetBuildingsFailure;
}
