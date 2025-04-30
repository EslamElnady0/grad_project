import 'dart:io';

import 'package:dio/dio.dart';
import 'package:grad_project/core/networking/api_error_handler.dart';
import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/lecture_manager/data/models/add_material_request_model.dart';
import 'package:grad_project/features/lecture_manager/data/models/add_material_response_model.dart';

import '../data sources/add_materials_local_data_source.dart';
import '../data sources/add_materials_remote_data_source.dart';
class AddMaterialsRepo {
  final AddMaterialsRemoteDataSource remoteDataSource;
  final AddMaterialsLocalDataSource localDataSource;

  AddMaterialsRepo({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Future<ApiResult<AddMaterialResponseModel>> createMaterial({
    required AddMaterialRequestModel addMaterialRequestModel,
    required int materialId,
  }) async {
    try {
      // Convert File objects to MultipartFile objects
      List<MultipartFile> multipartFiles = await Future.wait(
        addMaterialRequestModel.material.map((file) async {
          return await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          );
        }),
      );

      final result = await remoteDataSource.add(
        materialId,
        addMaterialRequestModel.title,
        addMaterialRequestModel.week.toString(),
        addMaterialRequestModel.type,
        multipartFiles,
      );
      
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}