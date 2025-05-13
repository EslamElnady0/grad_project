import 'package:dio/dio.dart';
import 'package:grad_project/core/networking/api_constants.dart';
import 'package:grad_project/features/profile/data/models/get_profile_response_model.dart';
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

  // @POST(ApiConstants.profile)
  // @MultiPart()
  // Future<ProfileResponseModel> updateProfile(
  //   @Part(name: 'name') String name,
  //   @Part(name: 'email') String email,
  //   @Part(name: 'phone') String phone,
  //   @Part(name: 'image') File image,
  // );
}
