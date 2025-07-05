import 'package:dio/dio.dart';
import 'package:grad_project/core/data/models/sub_to_push_notifications_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../networking/api_constants.dart';
part 'sub_to_push_notifications_remote_data_source.g.dart';

//if this file is created for the first time or modified
//run the command:
//?=> dart run build_runner build --delete-conflicting-outputs
//to generate the .g.dart file
@RestApi(baseUrl: ApiConstants.apiBaseUrlSecond)
abstract class SubToPushNotificationsRemoteDataSource {
  factory SubToPushNotificationsRemoteDataSource(Dio dio,
      {String baseUrl,
      ParseErrorLogger? errorLogger}) = _SubToPushNotificationsRemoteDataSource;

  @POST(ApiConstants.saveNotification)
  Future<void> saveNotification(
    @Body() SubToPushNotificationsModel body,
  );
  @DELETE(ApiConstants.removeNotification)
  Future<void> removeNotification(
    @Body() UnSubPushNotificationsModel body,
  );
}
