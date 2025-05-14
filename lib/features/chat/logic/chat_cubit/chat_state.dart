part of 'chat_cubit.dart';

@freezed
class ChatState<T> with _$ChatState {
  const factory ChatState.initial() = _Initial;
  const factory ChatState.chatLoading() = ChatLoading;
  const factory ChatState.chatSuccess(T data) = ChatSuccess<T>;
  const factory ChatState.chatFailure(String error) = ChatFailure;
}
