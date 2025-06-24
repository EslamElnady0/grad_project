abstract class InnerChatState {}

class InnerChatInitial extends InnerChatState {}

class InnerChatLoading extends InnerChatState {}

class InnerChatRegistered extends InnerChatState {}

class InnerChatSending extends InnerChatState {}

class InnerChatSeeningMessage extends InnerChatState {}

class InnerChatMessageSent extends InnerChatState {}

class InnerChatMessageSeen extends InnerChatState {}

class InnerChatMessageReceived extends InnerChatState {}

class InnerChatError extends InnerChatState {
  final String message;
  InnerChatError(this.message);
}

class InnerChatTyping extends InnerChatState {}

class InnerChatTypingSuccess extends InnerChatState {}

class InnerChatStopTyping extends InnerChatState {}

class InnerChatStopTypingSuccess extends InnerChatState {}
