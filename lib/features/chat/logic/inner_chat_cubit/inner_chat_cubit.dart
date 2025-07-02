import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/events/typing%20events/user_typing_event.dart';
import 'package:grad_project/features/chat/data/models/send_message_model.dart';
import '../../../../core/events/message events/messages_events.dart';
import '../../data/repos/chat_repo.dart';
import 'inner_chat_state.dart';

class InnerChatCubit extends Cubit<InnerChatState> {
  ScrollController scrollController = ScrollController();
  final ChatRepo _repo;
  final StreamController<List<UserTypingEvent>> _sendersSubscriptionController =
      StreamController.broadcast();
  StreamSubscription? _messageSubscription;
  StreamSubscription? _typingSubscription;

  List<UserTypingEvent> senders = [];
  Stream<List<UserTypingEvent>>? get sendersStream =>
      _sendersSubscriptionController.stream;

  InnerChatCubit(this._repo) : super(InnerChatInitial()) {
    _messageSubscription = eventBus.on<NewMessageEvent>().listen((event) {
      if (scrollController.hasClients) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollController.animateTo(
            scrollController.position.minScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        });
        messageSeen(event.message.id);
      }
    });
    _typingSubscription = eventBus.on<UserTypingEvent>().listen((event) {
      if (event.type.isNotEmpty) {
        senders.add(UserTypingEvent(user: event.user, type: event.type));
        _sendersSubscriptionController.add(List.from(senders));
      } else {
        senders
            .removeWhere((inListEvent) => inListEvent.user.id == event.user.id);
        _sendersSubscriptionController.add(List.from(senders));
      }
    });
  }
  void sendMessage(
      {String? messageText,
      List<Attachment>? attachments,
      required BuildContext context}) {
    _repo.sendMessage(
        SendMessageModel(text: messageText, attachments: attachments));
  }

  void messageSeen(String messageId) {
    _repo.messageSeen(messageId);
  }

  void changeTypingState(String typingState) {
    _repo.typingState(typingState: typingState);
  }

  void stopTyping() {
    _repo.stopTyping();
  }

  void closeChat() {
    _repo.closeChat();
  }

  void openChat() {
    _repo.openChat();
  }

  @override
  Future<void> close() {
    _repo.dispose();
    scrollController.dispose();
    _messageSubscription?.cancel();
    _typingSubscription?.cancel();
    _sendersSubscriptionController.close();
    return super.close();
  }
}
