import 'package:grad_project/core/networking/api_error_handler.dart';
import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/annoucements/data/models/add_annoucement_response_body.dart';
import 'package:grad_project/features/annoucements/data/models/delete_annoucement_response_body.dart';
import 'package:grad_project/features/annoucements/data/models/paginated_announcements_response.dart';
import 'package:grad_project/core/data/models/teachers_courses_response.dart';
import 'package:grad_project/features/annoucements/data/models/update_annoucement_response_body.dart';
import '../../../../core/flavors/flavors_functions.dart';
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

  Future<ApiResult<SimpleResponseBody>> addAnnoucement(
      AnnouncementRequestBody announcementRequestBody) async {
    try {
      final response =
          await remoteDataSource.addAnnoucement(announcementRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<PaginatedAnnouncementsResponse>> getAnnoucements(
      AnnouncementRequestBody announcementRequestBody) async {
    try {
      late PaginatedAnnouncementsResponse response;
      if (FlavorsFunctions.isAdmin()) {
        response =
            await remoteDataSource.getAnnoucements(announcementRequestBody);
      } else {
        response = await remoteDataSource.getStudentsAnnoucements();
      }
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<PaginatedAnnouncementsResponse>>
      getStudentsAnnoucements() async {
    try {
      final response = await remoteDataSource.getStudentsAnnoucements();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<TeachersCoursesResponse>> getTeacherCourses() async {
    try {
      final response = await remoteDataSource.getTeacherCourses();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<UpdateAnnoucementResponseBody>> updateAnnoucement(
      {required AnnouncementRequestBody announcementRequestBody,
      required String id}) async {
    try {
      final response =
          await remoteDataSource.updateAnnoucement(id, announcementRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<DeleteAnnoucementResponseBody>> deleteAnnoucement(
      {required String annoucementId}) async {
    try {
      final response = await remoteDataSource.deleteAnnoucement(annoucementId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
