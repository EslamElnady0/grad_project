import 'package:dio/dio.dart';
import 'package:grad_project/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/auth/data/models/login_request_model.dart';
import '../../features/auth/data/models/login_response_model.dart';
import '../../features/weekly_schedule/data/models/update_session_request_model.dart';
import '../../features/weekly_schedule/data/models/update_session_response_model.dart';


part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

@POST('{loginEndpoint}')
  Future<LoginResponseModel> login(
    @Path() String loginEndpoint,
    @Body() LoginRequestModel loginRequestBody,
  );


}
