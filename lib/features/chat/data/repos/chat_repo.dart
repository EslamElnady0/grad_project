import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/chat/data/models/chat_groups_response.dart';
import 'package:grad_project/features/chat/data/models/get_messages_response.dart';
import 'package:grad_project/features/chat/data/models/group_details_response.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../data sources/chat_local_data_source.dart';
import '../data sources/chat_remote_data_source.dart';

class ChatRepo {
  final ChatRemoteDataSource remoteDataSource;
  final ChatLocalDataSource localDataSource;

  ChatRepo({
    required this.remoteDataSource,
    required this.localDataSource,
  });
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
}
