import 'package:dio/dio.dart';
import 'package:grad_project/core/networking/api_constants.dart';
import 'package:grad_project/features/subjects/data/model/delete_course_material_response_model.dart';
import 'package:retrofit/retrofit.dart';


part 'subjects_remote_data_source.g.dart';
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SubjectsRemoteDataSource {
  factory SubjectsRemoteDataSource(Dio dio,
      {String baseUrl, ParseErrorLogger? errorLogger}) = _SubjectsRemoteDataSource;

  @DELETE("teachers/course-materials/{id}")
  Future<DeleteCourseMaterialResponseModel> deleteCourseMaterial(
    @Path("id") int id);
}
