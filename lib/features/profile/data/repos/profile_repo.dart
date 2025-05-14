import 'dart:io';

import 'package:grad_project/core/networking/api_error_handler.dart';
import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/profile/data/data_sources/profile_local_data_source.dart';
import 'package:grad_project/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:grad_project/features/profile/data/models/get_profile_response_model.dart';
import 'package:grad_project/features/profile/data/models/update_profile_response_model.dart';

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

  Future<ApiResult<UpdateProfileResponseModel>> updateStudentProfile(
      String? password, File? avatar) async {
    try {
      final response = await remoteDataSource.updateStudentProfile(password, avatar);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<UpdateProfileResponseModel>> updateTeacherProfile(
      String? password, File? avatar) async {
    try {
      final response = await remoteDataSource.updateTeacherProfile(password, avatar);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

}