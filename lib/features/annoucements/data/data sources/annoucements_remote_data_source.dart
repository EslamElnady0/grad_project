import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/add_annoucement_request_body.dart';
import '../models/add_annoucement_response_body.dart';
part 'annoucements_remote_data_source.g.dart';

//if this file is created for the first time or modified
//run the command:
//?=> dart run build_runner build --delete-conflicting-outputs
//to generate the .g.dart file
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AnnoucementsRemoteDataSource {
  factory AnnoucementsRemoteDataSource(Dio dio,
      {String baseUrl,
      ParseErrorLogger? errorLogger}) = _AnnoucementsRemoteDataSource;

  @POST("${ApiConstants.dashboard}${ApiConstants.announcements}")
  Future<AddAnnouncementResponseBody> addAnnoucement(
      @Body() AddAnnouncementRequestBody addAnnouncementRequestBody);
}
