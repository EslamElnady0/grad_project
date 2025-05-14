part of 'get_group_details_cubit.dart';
@freezed
class GetGroupDetailsState<T> with _$GetGroupDetailsState {
  const factory GetGroupDetailsState.initial() = _Initial;
  const factory GetGroupDetailsState.getGroupDetailsLoading() = GetGroupDetailsLoading;
  const factory GetGroupDetailsState.getGroupDetailsSuccess(T data) = GetGroupDetailsSuccess<T>;
  const factory GetGroupDetailsState.getGroupDetailsFailure(String error) = GetGroupDetailsFailure;
}
