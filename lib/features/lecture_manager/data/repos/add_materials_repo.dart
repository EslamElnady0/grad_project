import 'package:dio/dio.dart';
import 'package:grad_project/core/networking/api_constants.dart';
import 'package:grad_project/core/networking/api_result.dart';
import '../../../../core/networking/api_error_handler.dart';

class AddMaterialsRepo {
  final Dio dio;

  AddMaterialsRepo(this.dio);
  Future<ApiResult<AddMaterialsResponseModel>> upload({
    required int id,
    required FormData data,
    required void Function(int sentBytes, int totalBytes)? onProgress,
  }) async {
    try {
      Response response = await dio.request(
        '${ApiConstants.apiBaseUrl}teachers/course-materials/$id',
        options: Options(
          method: 'POST',
        ),
        data: data,
        onSendProgress: onProgress,
      );

      AddMaterialsResponseModel result = AddMaterialsResponseModel(
        code: response.statusCode ?? 0,
        message: response.data['message'] ?? 'Unknown error',
      );
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}

class AddMaterialsResponseModel {
  final int code;
  final String message;

  AddMaterialsResponseModel({required this.code, required this.message});
}
