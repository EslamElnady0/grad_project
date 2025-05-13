import 'package:dio/dio.dart';
import 'package:grad_project/features/chat/data/models/get_messages_response.dart';
import 'package:grad_project/features/chat/data/models/group_details_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/chat_groups_response.dart';
part 'chat_remote_data_source.g.dart';

//if this file is created for the first time or modified
//run the command:
//?=> dart run build_runner build --delete-conflicting-outputs
//to generate the .g.dart file
@RestApi(baseUrl: ApiConstants.apiBaseUrlSecond)
abstract class ChatRemoteDataSource {
  factory ChatRemoteDataSource(Dio dio,
      {String baseUrl, ParseErrorLogger? errorLogger}) = _ChatRemoteDataSource;

  @GET(ApiConstants.chatGroups)
  Future<ChatGroupResponse> getChatGroups();

  @GET(ApiConstants.groupDetails)
  Future<GroupDetailsResponse> getChatGroupDetails();

  @GET(ApiConstants.messages)
  Future<GetMessagesResponse> getLatestMessages();

  @GET("${ApiConstants.oldMessages}/{messageId}")
  Future<GetMessagesResponse> getOlder30Messages(
      @Path("messageId") String messageId);
}
