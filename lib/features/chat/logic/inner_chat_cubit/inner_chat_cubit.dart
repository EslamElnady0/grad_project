import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../data/models/get_messages_response.dart';
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
        if (context.mounted) {
          recieveMessage(context);
        }
        log("user registered successfully");
      },
      onFailure: (error) {
        emit(InnerChatError(error));
        log("user registration failed");
      },
    );
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

  void recieveMessage(
    BuildContext context,
  ) {
    _repo.recieveMessage(onSuccess: (data) async {
      final newMessage = Message(
          senderId: int.parse(
              await SharedPrefHelper.getString(Constants.userId) ?? 0),
          content: data['text'],
          id: "",
          status: Status(deliveredTo: [], seenBy: []),
          createdAt: DateTime.now());
      if (context.mounted) {
        context.read<GetLatestMessagesCubit>().addMessage(newMessage);
      }
      emit(InnerChatMessageReceived());
    });
  }

  @override
  Future<void> close() {
    _repo.dispose();
    return super.close();
  }
}
