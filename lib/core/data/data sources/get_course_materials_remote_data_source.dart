import 'package:dio/dio.dart';
import 'package:grad_project/core/data/models/get_course_materials_response_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../networking/api_constants.dart';
part 'get_course_materials_remote_data_source.g.dart';

//if this file is created for the first time or modified
//run the command:
//?=> dart run build_runner build --delete-conflicting-outputs
//to generate the .g.dart file
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class GetCourseMaterialsRemoteDataSource {
  factory GetCourseMaterialsRemoteDataSource(Dio dio,
      {String baseUrl,
      ParseErrorLogger? errorLogger}) = _GetCourseMaterialsRemoteDataSource;

  @GET("${ApiConstants.courseMaterials}/{id}")
  Future<GetCourseMaterialsResponseModel> getCourseMaterials(
    @Path("id") int courseId,
  );
}
