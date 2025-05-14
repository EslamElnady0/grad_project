import 'dart:io';

import 'package:dio/dio.dart';
import 'package:grad_project/core/networking/api_constants.dart';
import 'package:grad_project/features/profile/data/models/get_profile_response_model.dart';
import 'package:grad_project/features/profile/data/models/update_profile_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProfileRemoteDataSource {
  factory ProfileRemoteDataSource(Dio dio,
      {String baseUrl,
      ParseErrorLogger? errorLogger}) = _ProfileRemoteDataSource;

  @GET(ApiConstants.profile)
  Future<StudentProfileResponseModel> getStudentProfile();

  @GET("${ApiConstants.teachers}${ApiConstants.profile}")
  Future<TeacherProfileResponseModel> getTeacherProfile();

  @POST(ApiConstants.update)
  @MultiPart()
  Future<UpdateProfileResponseModel> updateStudentProfile(
    @Part(name: 'password') String? password,
    @Part(name: 'avatar') File? avatar,
  );

  @POST("${ApiConstants.teachers}${ApiConstants.update}")
  @MultiPart()
  Future<UpdateProfileResponseModel> updateTeacherProfile(
    @Part(name: 'password') String? password,
    @Part(name: 'avatar') File? avatar,
  );
}
