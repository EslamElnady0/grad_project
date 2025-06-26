import 'package:dio/dio.dart';
import 'package:grad_project/core/data/models/students_courses_response.dart';
import 'package:retrofit/retrofit.dart';
import '../models/teachers_courses_response.dart';
import '../../networking/api_constants.dart';
part 'all_courses_remote_data_source.g.dart';

//if this file is created for the first time or modified
//run the command:
//?=> dart run build_runner build --delete-conflicting-outputs
//to generate the .g.dart file
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AllCoursesRemoteDataSource {
  factory AllCoursesRemoteDataSource(Dio dio,
      {String baseUrl,
      ParseErrorLogger? errorLogger}) = _AllCoursesRemoteDataSource;

  @GET(ApiConstants.courses)
  Future<StudentsCoursesResponse> getStudentsCourses();

  @GET("${ApiConstants.teachers}${ApiConstants.courses}")
  Future<TeachersCoursesResponse> getTeacherCourses();
}