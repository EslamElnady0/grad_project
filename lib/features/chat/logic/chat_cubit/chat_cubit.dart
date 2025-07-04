import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/data/repos/socket_repo.dart';
import '../../data/repos/chat_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../../../../core/events/message events/messages_events.dart';
part 'chat_state.dart';
part 'chat_cubit.freezed.dart';

class ChatGroupsCubit extends Cubit<ChatState> {
  final ChatRepo _repo;
  final SocketRepo _socketRepo;
  StreamSubscription? _unSeenMessagesSubscription;
  final BehaviorSubject<UnSeenMessagesEvent> unSeenMessagesSubject =
      BehaviorSubject<UnSeenMessagesEvent>();
  Stream<UnSeenMessagesEvent> get unSeenMessagesStream =>
      unSeenMessagesSubject.stream;
  ChatGroupsCubit(this._repo, this._socketRepo)
      : super(const ChatState.initial()) {
    _unSeenMessagesSubscription =
        eventBus.on<UnSeenMessagesEvent>().listen((event) async {
      unSeenMessagesSubject.add(event);
    });
  }

  Future<void> getChatGroups() async {
    emit(const ChatState.chatLoading());
    final result = await _repo.getChatGroups();
    result.when(
      success: (data) => emit(ChatState.chatSuccess(data)),
      failure: (error) => emit(ChatState.chatFailure(error.getAllMessages())),
    );
  }

  void unSeenMessages() {
    _socketRepo.unSeenMessages();
  }

  @override
  Future<void> close() {
    _unSeenMessagesSubscription?.cancel();
    unSeenMessagesSubject.close();
    return super.close();
  }
}
