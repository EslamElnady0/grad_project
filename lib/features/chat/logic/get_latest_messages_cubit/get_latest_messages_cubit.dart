import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/chat/data/models/get_messages_response.dart';
import 'package:grad_project/features/chat/data/repos/chat_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/events/new_message_event.dart';
part 'get_latest_messages_state.dart';
part 'get_latest_messages_cubit.freezed.dart';

class GetLatestMessagesCubit extends Cubit<GetLatestMessagesState> {
  final ChatRepo _repo;
  final StreamController<List<Message>> _messagesStreamController =
      StreamController.broadcast();
  StreamSubscription? _messageSubscription;

  GetLatestMessagesCubit(this._repo)
      : super(const GetLatestMessagesState.initial()) {
    _messageSubscription = eventBus.on<NewMessageEvent>().listen((event) {
      addMessage(event.message);
    });
  }

  List<Message> messagesList = [];

  Stream<List<Message>> get messagesStream => _messagesStreamController.stream;

  Future<void> getLatestMessages() async {
    emit(const GetLatestMessagesState.getLatestMessagesLoading());
    final result = await _repo.getLatestMessages();
    result.when(
      success: (data) {
        messagesList = data.data;
        _messagesStreamController.add(messagesList);
        emit(GetLatestMessagesState.getLatestMessagesSuccess(data));
      },
      failure: (error) => emit(GetLatestMessagesState.getLatestMessagesFailure(
          error.getAllMessages())),
    );
  }

  Future<void> getOlder30Messages() async {
    _isPaginating = true;
    emit(const GetLatestMessagesState.getLatestMessagesLoading());

    final result = await _repo.getOlder30Messages(messagesList.last.id);

    result.when(
      success: (data) {
        List<Message> olderMessages = data.data;
        messagesList = messagesList + olderMessages;
        _messagesStreamController.add(messagesList);
        emit(GetLatestMessagesState.getLatestMessagesSuccess(data));
      },
      failure: (error) => emit(GetLatestMessagesState.getLatestMessagesFailure(
          error.getAllMessages())),
    );

    _isPaginating = false;
  }

  bool get isPaginating => _isPaginating;
  bool _isPaginating = false;

  void addMessage(Message newMsg) {
    messagesList.insert(0, newMsg);
    _messagesStreamController.add(messagesList);
  }

  @override
  Future<void> close() {
    _messagesStreamController.close();
    _messageSubscription?.cancel();
    return super.close();
  }
}
