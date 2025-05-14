import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/events/new_message_event.dart';
import '../../data/repos/chat_repo.dart';
import 'inner_chat_state.dart';

class InnerChatCubit extends Cubit<InnerChatState> {
  ScrollController scrollController = ScrollController();
  final ChatRepo _repo;
  StreamSubscription? _messageSubscription;
  bool isChatViewActive = false;

  InnerChatCubit(this._repo) : super(InnerChatInitial()) {
    _messageSubscription = eventBus.on<NewMessageEvent>().listen((event) {
      if (isChatViewActive && scrollController.hasClients) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollController.animateTo(
            scrollController.position.minScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        });
      }
    });
  }

  void setChatViewActive(bool active) {
    isChatViewActive = active;
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

  @override
  Future<void> close() {
    _repo.dispose();
    scrollController.dispose();
    _messageSubscription?.cancel();
    return super.close();
  }
}
