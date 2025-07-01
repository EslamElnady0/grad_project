import 'dart:developer';
import 'package:grad_project/core/events/message%20events/messages_events.dart';
import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/chat/data/models/chat_groups_response.dart';
import 'package:grad_project/features/chat/data/models/get_messages_response.dart';
import 'package:grad_project/features/chat/data/models/group_details_response.dart';
import '../../../../core/events/typing events/user_typing_event.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../data sources/chat_local_data_source.dart';
import '../data sources/chat_remote_data_source.dart';
import '../../../../core/services/socket_service.dart';
import '../models/send_message_model.dart';

class ChatRepo {
  final ChatRemoteDataSource remoteDataSource;
  final SocketService socketService;
  final ChatLocalDataSource localDataSource;

  // Track active listeners to prevent duplicates
  final Set<String> _activeListeners = {};

  ChatRepo(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.socketService});

  /// Add a listener only if it's not already active
  void _addListenerOnce(String event, Function(dynamic) callback) {
    if (!_activeListeners.contains(event)) {
      socketService.on(event, callback);
      _activeListeners.add(event);
    } else {
      log('Listener already exists for event: $event, skipping...');
    }
  }

  /// Remove a specific listener and mark it as inactive
  void _removeListener(String event) {
    if (_activeListeners.contains(event)) {
      socketService.off(event);
      _activeListeners.remove(event);
    }
  }

  /// Remove all active listeners
  void _removeAllListeners() {
    for (String event in _activeListeners.toList()) {
      socketService.off(event);
    }
    _activeListeners.clear();
  }

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
    SendMessageModel message, {
    required Function onSuccess,
    required Function(String error) onFailure,
  }) {
    // Remove existing listeners before adding new ones

    socketService.emit(SocketEvents.sendMessage, message.toJson());
  }

  void messageSeen(
    String messageId, {
    required Function onSuccess,
    required Function(String error) onFailure,
  }) {
    // Remove existing listeners before adding new ones
    _removeListener(SocketEvents.messageSeenSuccess);
    _removeListener(SocketEvents.messageSeenError);

    socketService.emit(SocketEvents.messageSeen, {'messageId': messageId});

    _addListenerOnce(SocketEvents.messageSeenSuccess, (data) {
      onSuccess(data);
    });

    _addListenerOnce(SocketEvents.messageSeenError, (error) {
      onFailure(error.toString());
    });
  }

  void openChat({
    required Function(dynamic data) onSuccess,
    required Function(String error) onFailure,
  }) {
    // Remove existing listeners before adding new ones
    _removeListener(SocketEvents.openChatSuccess);
    _removeListener(SocketEvents.openChatInfo);
    _removeListener(SocketEvents.openChatError);
    _removeListener(SocketEvents.typingSuccess);
    _removeListener(SocketEvents.typingError);
    _removeListener(SocketEvents.stopTypingSuccess);
    _removeListener(SocketEvents.stopTypingError);
    _removeListener(SocketEvents.sendMessageError);

    socketService.emit(SocketEvents.openChat, {});

    _addListenerOnce(SocketEvents.openChatSuccess, (data) {
      onSuccess(data);
    });

    _addListenerOnce(SocketEvents.openChatError, (error) {
      onFailure(error.toString());
    });

    _addListenerOnce(SocketEvents.typingSuccess, (data) {
      log(data.toString());
      Sender sender = Sender.fromJson(data["user"]);
      eventBus.fire(UserTypingEvent(
        type: data["type"],
        user: sender,
      ));
      onSuccess(data);
    });

    _addListenerOnce(SocketEvents.typingError, (error) {
      onFailure(error.toString());
    });

    _addListenerOnce(SocketEvents.stopTypingSuccess, (data) {
      eventBus.fire(UserTypingEvent(
        type: "",
        user: Sender.fromJson(data["user"]),
      ));
      onSuccess(data);
    });

    _addListenerOnce(SocketEvents.stopTypingError, (error) {
      onFailure(error.toString());
    });
    _addListenerOnce(SocketEvents.openChatInfo, (data) {
      final joinningUser = data["sender"];
      eventBus.fire(UserJoiningEvent(
        Sender.fromJson(joinningUser),
      ));
    });

    _addListenerOnce(SocketEvents.sendMessageError, (error) {
      log("message sending failed error: $error");
      onFailure(error.toString());
    });
  }

  void typingState({
    required String typingState,
    required Function(dynamic data) onSuccess,
    required Function(String error) onFailure,
  }) {
    // Remove existing listeners before adding new ones

    socketService.emit(SocketEvents.typing, {
      "type": typingState,
    });
  }

  void stopTyping({
    required Function(dynamic data) onSuccess,
    required Function(String error) onFailure,
  }) {
    // Remove existing listeners before adding new ones

    socketService.emit(SocketEvents.stopTyping, {});
  }

  void closeChat({
    required Function(dynamic data)? onSuccess,
    required Function(String error)? onFailure,
  }) {
    // Remove existing listeners before adding new ones
    _removeListener(SocketEvents.closeChatSuccess);
    _removeListener(SocketEvents.closeChatError);

    socketService.emit(SocketEvents.closeChat, {});

    _addListenerOnce(SocketEvents.closeChatSuccess, (data) {
      onSuccess != null ? onSuccess(data) : () {};
    });

    _addListenerOnce(SocketEvents.closeChatError, (error) {
      onFailure != null ? onFailure(error.toString()) : () {};
    });
  }

  void dispose() {
    _removeAllListeners();
    closeChat(onSuccess: (data) {}, onFailure: (error) {});
    log('ChatRepo disposed - all listeners removed');
  }
}
