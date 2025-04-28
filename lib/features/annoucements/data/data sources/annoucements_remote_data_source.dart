import 'package:dio/dio.dart';
import 'package:grad_project/features/annoucements/data/models/delete_annoucement_response_body.dart';
import 'package:grad_project/features/annoucements/data/models/paginated_announcements_response.dart';
import 'package:grad_project/features/annoucements/data/models/teachers_courses_response.dart';
import 'package:grad_project/features/annoucements/data/models/update_annoucement_response_body.dart';
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
      @Body() AnnouncementRequestBody announcementRequestBody);

  @GET("${ApiConstants.dashboard}${ApiConstants.announcements}")
  Future<PaginatedAnnouncementsResponse> getAnnoucements(
      @Body() AnnouncementRequestBody announcementRequestBody);

  @GET("${ApiConstants.teachers}${ApiConstants.courses}")
  Future<TeachersCoursesResponse> getTeacherCourses();

  @PUT(
      "${ApiConstants.dashboard}${ApiConstants.announcements}/{announcementId}")
  Future<UpdateAnnoucementResponseBody> updateAnnoucement(
    @Path() String announcementId,
    @Body() AnnouncementRequestBody announcementRequestBody,
  );
  @DELETE(
      "${ApiConstants.dashboard}${ApiConstants.announcements}/{announcementId}")
  Future<DeleteAnnoucementResponseBody> deleteAnnoucement(
    @Path() String announcementId,
  );
}
