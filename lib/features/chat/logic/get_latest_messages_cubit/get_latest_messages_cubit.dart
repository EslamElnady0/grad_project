import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/chat/data/repos/chat_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_latest_messages_state.dart';
part 'get_latest_messages_cubit.freezed.dart';

class GetLatestMessagesCubit extends Cubit<GetLatestMessagesState> {
  final ChatRepo _repo;
  GetLatestMessagesCubit(this._repo)
      : super(const GetLatestMessagesState.initial());

  Future<void> getLatestMessages() async {
    emit(const GetLatestMessagesState.getLatestMessagesLoading());
    final result = await _repo.getLatestMessages();
    result.when(
      success: (data) =>
          emit(GetLatestMessagesState.getLatestMessagesSuccess(data)),
      failure: (error) => emit(GetLatestMessagesState.getLatestMessagesFailure(
          error.getAllMessages())),
    );
  }
}
