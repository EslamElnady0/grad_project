import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/chat_repo.dart';
import '../get_latest_messages_cubit/get_latest_messages_cubit.dart';
import 'inner_chat_state.dart';

class InnerChatCubit extends Cubit<InnerChatState> {
  final ChatRepo _repo;

  InnerChatCubit(this._repo) : super(InnerChatInitial());
  Future<void> init({Function? onConnected}) async {
    await _repo.initSocket(onConnected: onConnected);
  }

  void registerUser(BuildContext context) {
    emit(InnerChatLoading());
    _repo.registerUser(
      {},
      onSuccess: () async {
        emit(InnerChatRegistered());
        await context.read<GetLatestMessagesCubit>().getLatestMessages();
        log("user registered successfully");
      },
      onFailure: (error) {
        emit(InnerChatError(error));
        log("user registration failed");
      },
    );
  }

  void sendMessage(String messageText) {
    emit(InnerChatSending());
    _repo.sendMessage(
      messageText,
      onSuccess: () => emit(InnerChatMessageSent()),
      onFailure: (error) => emit(InnerChatError(error)),
    );
  }

  @override
  Future<void> close() {
    _repo.dispose();
    return super.close();
  }
}
