part of 'get_latest_messages_cubit.dart';
@freezed
class GetLatestMessagesState<T> with _$GetLatestMessagesState {
  const factory GetLatestMessagesState.initial() = _Initial;
  const factory GetLatestMessagesState.getLatestMessagesLoading() = GetLatestMessagesLoading;
  const factory GetLatestMessagesState.getLatestMessagesSuccess(T data) = GetLatestMessagesSuccess<T>;
  const factory GetLatestMessagesState.getLatestMessagesFailure(String error) = GetLatestMessagesFailure;
}
