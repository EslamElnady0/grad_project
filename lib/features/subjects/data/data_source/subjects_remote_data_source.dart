import 'package:dio/dio.dart';
import 'package:grad_project/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';


part 'subjects_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SubjectsRemoteDataSource {
  factory SubjectsRemoteDataSource(Dio dio,
      {String baseUrl, ParseErrorLogger? errorLogger}) = _SubjectsRemoteDataSource;

  @DELETE("${ApiConstants.apiBaseUrl}teachers/course-materials/{id}")
  Future<void> deleteCourseMaterial(
    @Path("id") int id);
}