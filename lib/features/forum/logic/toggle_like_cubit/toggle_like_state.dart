part of 'toggle_like_cubit.dart';

@freezed
class ToggleLikeState<T> with _$ToggleLikeState<T> {
  const factory ToggleLikeState.initial() = _Initial;
  const factory ToggleLikeState.toggleLikeLoading() = ToggleLikeLoading;
  const factory ToggleLikeState.toggleLikeSuccess(T data) = ToggleLikeSuccess<T>;
  const factory ToggleLikeState.toggleLikeFailure(String error) = ToggleLikeFailure;
}