import 'package:dio/dio.dart';
import 'package:grad_project/features/map/data/model/get_buildings_response.dart';
import 'package:grad_project/features/map/data/model/get_halls_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
part 'building_and_halls_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class BuildingAndHallsRemoteDataSource {
  factory BuildingAndHallsRemoteDataSource(Dio dio,
      {String baseUrl,
      ParseErrorLogger? errorLogger}) = _BuildingAndHallsRemoteDataSource;

  @GET(ApiConstants.buildings)
  Future<GetBuildingsResponse> getBuildings();
  @GET(ApiConstants.halls)
  Future<GetHallsResponse> getHalls();
}
