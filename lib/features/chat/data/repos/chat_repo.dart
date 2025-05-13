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
    socketService.emit('User-Register', userData);

    socketService.on('user-register-success', (_) {
      log("user registered successfully");
      onSuccess();
    });

    socketService.on('user-register-error', (error) {
      log("user registration failed");
      onFailure(error.toString());
    });
  }

  void sendMessage(
    String messageText, {
    required Function onSuccess,
    required Function(String error) onFailure,
  }) {
    socketService.emit('Send-Message', {'message': messageText});

    socketService.on('send-message-success', (_) {
      onSuccess();
    });

    socketService.on('send-message-failure', (error) {
      onFailure(error.toString());
    });
  }

  void dispose() {
    socketService.off('user-register-success');
    socketService.off('user-register-error');
    socketService.socket.disconnect();
    socketService.socket.destroy();
    socketService.socket.close();
    socketService.socket.dispose();
  }
}
