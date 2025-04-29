import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../networking/api_constants.dart';
import '../models/all_courses_response_model.dart';

part 'all_courses_remote_data_source.g.dart';

//if this file is created for the first time or modified
//run the command:
//?=> dart run build_runner build --delete-conflicting-outputs
//to generate the .g.dart file
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AllCoursesRemoteDataSource {
  factory AllCoursesRemoteDataSource(Dio dio,
      {String baseUrl, ParseErrorLogger? errorLogger}) = _AllCoursesRemoteDataSource;

@GET('{endpoint}')
  Future<AllCoursesResponseModel> getAllCourses(
    @Path() String endpoint,
  );

}
