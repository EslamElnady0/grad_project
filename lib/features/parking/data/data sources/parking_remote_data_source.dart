import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/get_parking_slots_model.dart';
import '../../../../core/networking/api_constants.dart';
part 'parking_remote_data_source.g.dart';

//if this file is created for the first time or modified
//run the command:
//?=> dart run build_runner build --delete-conflicting-outputs
//to generate the .g.dart file
@RestApi(baseUrl: ApiConstants.apiBaseUrlSecond)
abstract class ParkingRemoteDataSource {
  factory ParkingRemoteDataSource(Dio dio,
      {String baseUrl,
      ParseErrorLogger? errorLogger}) = _ParkingRemoteDataSource;

  @GET(ApiConstants.parking)
  Future<GetParkingSlotsResponse> getParking();
}
