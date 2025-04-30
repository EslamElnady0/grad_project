import 'package:grad_project/core/data/models/all_courses.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import '../../networking/api_error_handler.dart' show ApiErrorHandler;
import '../../networking/api_result.dart';
import '../data sources/all_courses_remote_data_source.dart';

class AllCoursesRepo {
  final AllCoursesRemoteDataSource remoteDataSource;

  AllCoursesRepo({
    required this.remoteDataSource,
  });

  Future<ApiResult<AllCourses>> getAllCourses() async {
    try {
      if (FlavorsFunctions.isAdmin()) {
        final result = await remoteDataSource.getTeacherCourses();
        return ApiResult.success(AllCourses.teacher(result));
      } else {
        final result = await remoteDataSource.getStudentsCourses();
        return ApiResult.success(AllCourses.student(result));
      }
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
