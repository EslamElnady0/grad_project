import 'package:grad_project/core/networking/api_result.dart';
import 'package:grad_project/features/map/data/data%20sources/building_and_halls_remote_data_source.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../model/get_buildings_response.dart';
import '../model/get_halls_response.dart';

class HallsAndBuildingsRepo {
  final BuildingAndHallsRemoteDataSource remoteDataSource;
  HallsAndBuildingsRepo(this.remoteDataSource);

  Future<ApiResult<GetBuildingsResponse>> getBuildings() async {
    try {
      final result = await remoteDataSource.getBuildings();
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<GetHallsResponse>> getHalls() async {
    try {
      final result = await remoteDataSource.getHalls();
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
