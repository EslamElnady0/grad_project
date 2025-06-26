import '../data sources/parking_remote_data_source.dart';
import 'package:grad_project/core/networking/api_result.dart';
import '../models/get_parking_slots_model.dart';
import 'package:grad_project/core/networking/api_error_handler.dart';

class ParkingRepo {
  final ParkingRemoteDataSource remoteDataSource;

  ParkingRepo({
    required this.remoteDataSource,
  });

  Future<ApiResult<GetParkingSlotsResponse>> getParkingSlots() async {
    try {
      final response = await remoteDataSource.getParking();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
