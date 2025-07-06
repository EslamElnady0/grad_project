import 'package:grad_project/core/networking/api_error_handler.dart';
import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/dashboard/data/models/students_response.dart';

import '../data sources/dashboard_remote_data_source.dart';

class DashboardRepo {
  final DashboardRemoteDataSource remoteDataSource;

  DashboardRepo({
    required this.remoteDataSource,
  });

  Future<ApiResult<StudentsResponse>> getCourseStudents(
    String courseId,
  ) async {
    try {
      final response = await remoteDataSource.getCourseStudents(courseId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
