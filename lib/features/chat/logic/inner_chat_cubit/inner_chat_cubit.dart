import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/events/typing%20events/user_typing_event.dart';
import '../../../../core/events/message events/messages_events.dart';
import '../../data/models/get_messages_response.dart';
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
  void sendMessage(String messageText, BuildContext context) {
    emit(InnerChatSending());
    _repo.sendMessage(
      messageText,
      onSuccess: (data) {
        emit(InnerChatMessageSent());
      },
      onFailure: (error) => emit(InnerChatError(error)),
    );
  }

  void messageSeen(String messageId) {
    emit(InnerChatSeeningMessage());
    _repo.messageSeen(
      messageId,
      onSuccess: (data) {
        Map<String, dynamic> rawMessage = data["data"];
        Message mgs = Message.fromJson(rawMessage);
        emit(InnerChatMessageSeen());
        eventBus.fire(MessageUpdatedEvent(mgs));
      },
      onFailure: (error) => emit(InnerChatError(error)),
    );
  }

  void changeTypingState(String typingState) {
    emit(InnerChatTyping());
    _repo.typingState(
        typingState: typingState,
        onSuccess: (data) {
          emit(InnerChatTypingSuccess());
        },
        onFailure: (error) => emit(InnerChatError(error)));
  }

  void stopTyping() {
    emit(InnerChatStopTyping());
    _repo.stopTyping(
        onSuccess: (data) {
          emit(InnerChatStopTypingSuccess());
        },
        onFailure: (error) => emit(InnerChatError(error)));
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
