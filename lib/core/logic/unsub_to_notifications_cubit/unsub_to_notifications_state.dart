part of 'unsub_to_notifications_cubit.dart';

@freezed
class UnsubToNotificationsState<T> with _$UnsubToNotificationsState {
  const factory UnsubToNotificationsState.initial() = _Initial;
  const factory UnsubToNotificationsState.unsubToNotificationsLoading() =
      UnsubToNotificationsLoading;
  const factory UnsubToNotificationsState.unsubToNotificationsSuccess(T data) =
      UnsubToNotificationsSuccess<T>;
  const factory UnsubToNotificationsState.unsubToNotificationsFailure(
      String error) = UnsubToNotificationsFailure;
}
