part of 'get_halls_cubit.dart';

@freezed
class GetHallsState<T> with _$GetHallsState {
  const factory GetHallsState.initial() = _Initial;
  const factory GetHallsState.getHallsLoading() = GetHallsLoading;
  const factory GetHallsState.getHallsSuccess(T data) = GetHallsSuccess<T>;
  const factory GetHallsState.getHallsFailure(String error) = GetHallsFailure;
}
