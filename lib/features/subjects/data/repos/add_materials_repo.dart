import 'package:dio/dio.dart';
import 'package:grad_project/core/networking/api_constants.dart';
import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/subjects/data/data_source/subjects_remote_data_source.dart';
import 'package:grad_project/features/subjects/data/model/add_materials_response_model.dart';
import '../../../../core/networking/api_error_handler.dart';

class SubjectsRepo {
  final Dio dio;
  final SubjectsRemoteDataSource remoteDataSource ;
  SubjectsRepo({required this.dio , required this.remoteDataSource});  
  Future<ApiResult<AddMaterialsResponseModel>> upload({
    required int id,
    required FormData data, 
    required void Function(int sentBytes, int totalBytes)? onProgress,
  }) async {
    try {
   final response = await dio.post(
 '${ApiConstants.apiBaseUrl}teachers/course-materials/$id',
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


  Future<ApiResult<void>> deleteCourseMaterial(int id) async {
    try {
      await remoteDataSource.deleteCourseMaterial(id);
      return const ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
