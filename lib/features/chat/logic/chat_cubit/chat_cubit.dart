import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/chat_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_state.dart';
part 'chat_cubit.freezed.dart';

class ChatGroupsCubit extends Cubit<ChatState> {
  final ChatRepo _repo;
  ChatGroupsCubit(this._repo) : super(const ChatState.initial());

  Future<void> getChatGroups() async {
    emit(const ChatState.chatLoading());
    final result = await _repo.getChatGroups();
    result.when(
      success: (data) => emit(ChatState.chatSuccess(data)),
      failure: (error) => emit(ChatState.chatFailure(error.getAllMessages())),
    );
  }
}
