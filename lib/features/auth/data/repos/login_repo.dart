
import 'package:grad_project/core/networking/api_constants.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponseModel>> login(
      LoginRequestModel loginRequestBody) async {
    try {
      final response = await _apiService.login(ApiConstants.login,loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      //use here api error handler to know kind of error and then return api error model containing error message
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
