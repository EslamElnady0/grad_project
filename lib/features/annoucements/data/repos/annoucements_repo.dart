import 'package:grad_project/core/networking/api_error_handler.dart';
import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/annoucements/data/models/add_annoucement_response_body.dart';

import '../data sources/annoucements_local_data_source.dart';
import '../data sources/annoucements_remote_data_source.dart';
import '../models/add_annoucement_request_body.dart';

class AnnoucementsRepo {
  final AnnoucementsRemoteDataSource remoteDataSource;
  final AnnoucementsLocalDataSource localDataSource;

  AnnoucementsRepo({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Future<ApiResult<AddAnnouncementResponseBody>> addAnnoucement(
      AddAnnouncementRequestBody addAnnouncementRequestBody) async {
    try {
      final response =
          await remoteDataSource.addAnnoucement(addAnnouncementRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
