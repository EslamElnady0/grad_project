import 'package:grad_project/core/networking/api_error_handler.dart';
import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/profile/data/data_sources/profile_local_data_source.dart';
import 'package:grad_project/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:grad_project/features/profile/data/models/get_profile_response_model.dart';

class ProfileRepo {

final ProfileRemoteDataSource remoteDataSource;
  final ProfileLocalDataSource localDataSource;

  ProfileRepo({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Future<ApiResult<StudentProfileResponseModel>> getStudentProfile() async {
    try {
      final profile = await remoteDataSource.getStudentProfile();
      return ApiResult.success(profile);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<TeacherProfileResponseModel>> getTeacherProfile() async {
    try {
      final profile = await remoteDataSource.getTeacherProfile();
      return ApiResult.success(profile);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }



}