import 'dart:developer';
import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/chat/data/models/chat_groups_response.dart';
import 'package:grad_project/features/chat/data/models/get_messages_response.dart';
import 'package:grad_project/features/chat/data/models/group_details_response.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../data sources/chat_local_data_source.dart';
import '../data sources/chat_remote_data_source.dart';
import '../services/socket_service.dart';

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
  Future<void> initSocket({Function? onConnected}) async {
    log("initializing socket ......");
    await socketService.init(onConnect: onConnected);
  }

  void registerUser(
    Map<String, dynamic> userData, {
    required Function onSuccess,
    required Function(String error) onFailure,
  }) {
    log("registering user .....");
    socketService.emit(SocketEvents.userRegister, userData);

    socketService.once(SocketEvents.userRegisterSuccess, (_) {
      log("user registered successfully");
      onSuccess();
    });

    socketService.once(SocketEvents.userRegisterError, (error) {
      log("user registration failed");
      onFailure(error.toString());
    });
  }

  void sendMessage(
    String messageText, {
    required Function onSuccess,
    required Function(String error) onFailure,
  }) {
    socketService.emit(SocketEvents.sendMessage, {'text': messageText});
    //todo: send message success action
    socketService.once(SocketEvents.sendMessageError, (error) {
      log("message sending failed");
      onFailure(error.toString());
    });
  }

  void recieveMessage({required Function onSuccess}) {
    socketService.on(SocketEvents.recieveMessage, (data) {
      onSuccess(data);
      log(data.toString());
    });
  }

  void dispose() {
    socketService.off(SocketEvents.userRegisterSuccess);
    socketService.off(SocketEvents.userRegisterError);
    socketService.off(SocketEvents.recieveMessage);
    socketService.off(SocketEvents.sendMessageError);
    socketService.socket.disconnect();
    socketService.socket.destroy();
    socketService.socket.close();
    socketService.socket.dispose();
  }
}
