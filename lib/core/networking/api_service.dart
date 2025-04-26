import 'package:dio/dio.dart';
import 'package:grad_project/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/auth/data/models/login_request_model.dart';
import '../../features/auth/data/models/login_response_model.dart';


part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

 @POST(ApiConstants.studentLogin )
  Future<LoginResponseModel> login(
    @Body() LoginRequestModel loginRequestBody,
  );
 
}
