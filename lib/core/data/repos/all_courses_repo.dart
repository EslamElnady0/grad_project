import 'package:grad_project/core/data/models/all_courses_response_model.dart';

import '../../networking/api_error_handler.dart' show ApiErrorHandler;
import '../../networking/api_result.dart';
import '../data sources/all_courses_remote_data_source.dart';

class AllCoursesRepo {
  final AllCoursesRemoteDataSource remoteDataSource;

  AllCoursesRepo({
    required this.remoteDataSource,
  });

  Future<ApiResult<AllCoursesResponseModel>> getAllCourses() async {
    try {
      final response = await remoteDataSource.getAllCourses();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
