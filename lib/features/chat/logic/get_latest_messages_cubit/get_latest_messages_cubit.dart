import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/chat/data/models/get_messages_response.dart';
import 'package:grad_project/features/chat/data/repos/chat_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_latest_messages_state.dart';
part 'get_latest_messages_cubit.freezed.dart';

class GetLatestMessagesCubit extends Cubit<GetLatestMessagesState> {
  final ChatRepo _repo;
  final StreamController<List<Message>> _messagesStreamController =
      StreamController.broadcast();

  GetLatestMessagesCubit(this._repo)
      : super(const GetLatestMessagesState.initial());

  List<Message> messagesList = [];

  Stream<List<Message>> get messagesStream => _messagesStreamController.stream;

  Future<void> getLatestMessages() async {
    emit(const GetLatestMessagesState.getLatestMessagesLoading());
    final result = await _repo.getLatestMessages();
    result.when(
      success: (data) {
        messagesList = data.data;
        _messagesStreamController.add(messagesList); // stream update
        emit(GetLatestMessagesState.getLatestMessagesSuccess(data));
      },
      failure: (error) => emit(GetLatestMessagesState.getLatestMessagesFailure(
          error.getAllMessages())),
    );
  }

  void addMessage(Message newMsg) {
    messagesList.insert(0, newMsg);
    _messagesStreamController.add(messagesList); // notify listeners
  }

  @override
  Future<void> close() {
    _messagesStreamController.close();
    return super.close();
  }
}
