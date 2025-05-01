import 'package:dio/dio.dart';
import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/core/networking/dio_factory.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../data sources/add_materials_remote_data_source.dart';

class AddMaterialsRepo {
  Future<ApiResult<AddMaterialsResponseModel>> upload(
    FormData data,
  ) async {
    try {
      Dio dio = await DioFactory.getDio();
      Response response = await dio.request(
        'https://nextgenedu-database.azurewebsites.net/api/teachers/course-materials/198',
        options: Options(
          method: 'POST',
        ),
        data: data,
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
