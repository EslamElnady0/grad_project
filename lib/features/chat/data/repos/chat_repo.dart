import 'dart:developer';
import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/chat/data/models/chat_groups_response.dart';
import 'package:grad_project/features/chat/data/models/get_messages_response.dart';
import 'package:grad_project/features/chat/data/models/group_details_response.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../data sources/chat_local_data_source.dart';
import '../data sources/chat_remote_data_source.dart';
import '../../../../core/services/socket_service.dart';

class ChatRepo {
  final ChatRemoteDataSource remoteDataSource;
  final SocketService socketService;
  final ChatLocalDataSource localDataSource;

  ChatRepo(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.socketService});
  Future<ApiResult<ChatGroupResponse>> getChatGroups() async {
    try {
      final response = await remoteDataSource.getChatGroups();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<GroupDetailsResponse>> getGroupDetails() async {
    try {
      final response = await remoteDataSource.getChatGroupDetails();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<GetMessagesResponse>> getLatestMessages() async {
    try {
      final response = await remoteDataSource.getLatestMessages();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<GetMessagesResponse>> getOlder30Messages(
      String messageId) async {
    try {
      final response = await remoteDataSource.getOlder30Messages(messageId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  //toDo:--------------------------------------- Sockets Methods -------------------------------------------------------

  void sendMessage(
    String messageText, {
    required Function onSuccess,
    required Function(String error) onFailure,
  }) {
    socketService.emit(SocketEvents.sendMessage, {'text': messageText});
    //todo: send message success action
    socketService.on(SocketEvents.sendMessageError, (error) {
      log("message sending failed");
      onFailure(error.toString());
    });
  }

  void messageSeen(
    String messageId, {
    required Function onSuccess,
    required Function(String error) onFailure,
  }) {
    socketService.emit(SocketEvents.messageSeen, {'messageId': messageId});

    socketService.on(SocketEvents.messageSeenSuccess, (data) {
      log("message seen success");
      onSuccess(data);
    });
    socketService.on(SocketEvents.messageSeenError, (error) {
      log("message sending failed");
      onFailure(error.toString());
    });
  }

  void dispose() {
    //socketService.off(SocketEvents.recieveMessage);
    socketService.off(SocketEvents.sendMessageError);
    socketService.off(SocketEvents.messageSeenSuccess);
    socketService.off(SocketEvents.messageSeenError);
  }
}
