import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/route_response.dart';
part 'map_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.mapBaseUrl)
abstract class MapRemoteDataSource {
  factory MapRemoteDataSource(Dio dio,
      {String baseUrl, ParseErrorLogger? errorLogger}) = _MapRemoteDataSource;

  @GET("${ApiConstants.directions}/foot-walking")
  Future<RouteResponse> getRoute(
    @Query('api_key') String apiKey,
    @Query("start") String start,
    @Query("end") String end,
  );
}
