import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/get_messages_response.dart';
import '../../data/repos/chat_repo.dart';
import '../get_latest_messages_cubit/get_latest_messages_cubit.dart';
import 'inner_chat_state.dart';

class InnerChatCubit extends Cubit<InnerChatState> {
  ScrollController scrollController = ScrollController();
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
      final newMessage = Message.fromJson(data["data"]);

      if (context.mounted) {
        context.read<GetLatestMessagesCubit>().addMessage(newMessage);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (scrollController.hasClients) {
            scrollController.animateTo(
                scrollController.position.minScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          }
        });
      }
      emit(InnerChatMessageReceived());
    });
  }

  @override
  Future<void> close() {
    _repo.dispose();
    scrollController.dispose();
    return super.close();
  }
}
