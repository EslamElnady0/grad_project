import 'package:grad_project/core/data/data%20sources/sub_to_push_notifications_remote_data_source.dart';
import 'package:grad_project/core/networking/api_error_handler.dart';
import 'package:grad_project/core/networking/api_result.dart';

import '../models/sub_to_push_notifications_model.dart';

class SubToNotificationRepo {
  final SubToPushNotificationsRemoteDataSource remoteDataSource;
  SubToNotificationRepo(this.remoteDataSource);
  Future<ApiResult<void>> saveToken(SubToPushNotificationsModel body) async {
    try {
      final result = remoteDataSource.saveNotification(body);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> unsubscribe(String deviceToken) async {
    try {
      final result = remoteDataSource.removeNotification(
          UnSubPushNotificationsModel(deviceToken: deviceToken));
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
