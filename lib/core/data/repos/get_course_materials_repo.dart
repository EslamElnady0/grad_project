import 'package:grad_project/core/data/models/get_course_materials_response_model.dart';
import 'package:grad_project/core/networking/api_constants.dart';
import 'package:grad_project/core/networking/api_error_handler.dart';
import 'package:grad_project/core/networking/api_result.dart';

import '../data sources/get_course_materials_remote_data_source.dart';

class GetCourseMaterialsRepo {
  final GetCourseMaterialsRemoteDataSource remoteDataSource;

  GetCourseMaterialsRepo({
    required this.remoteDataSource,
  });
  Future<ApiResult<GetCourseMaterialsResponseModel>> getCourseMaterials({
    required int courseId,
  }) async {
    try {
      String path = "${ApiConstants.courseMaterials}/$courseId";

      final response = await remoteDataSource.getCourseMaterials(path);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
