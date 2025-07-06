import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/students_response.dart';

part 'dashboard_remote_data_source.g.dart';

//if this file is created for the first time or modified
//run the command:
//?=> dart run build_runner build --delete-conflicting-outputs
//to generate the .g.dart file
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class DashboardRemoteDataSource {
  factory DashboardRemoteDataSource(Dio dio,
      {String baseUrl,
      ParseErrorLogger? errorLogger}) = _DashboardRemoteDataSource;

  @GET("${ApiConstants.teachers}${ApiConstants.students}/{courseId}")
  Future<StudentsResponse> getCourseStudents(
    @Path("courseId") String courseId,
  );
}
