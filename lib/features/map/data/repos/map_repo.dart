import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../data sources/map_remote_data_source.dart';
import '../model/route_response.dart';

class MapRepo {
  final MapRemoteDataSource mapRemoteDataSource;
  final Location _location;
  final String orsApiKey;

  MapRepo({
    required this.orsApiKey,
    required this.mapRemoteDataSource,
  }) : _location = Location();

  Future<LocationData> getCurrentLocation() async {
    try {
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          throw Exception('Location service is disabled');
        }
      }

      PermissionStatus permission = await _location.hasPermission();
      if (permission == PermissionStatus.denied) {
        permission = await _location.requestPermission();
        if (permission != PermissionStatus.granted) {
          throw Exception('Location permission denied');
        }
      }

      return await _location.getLocation();
    } catch (e) {
      throw Exception('Failed to get current location: $e');
    }
  }

  Stream<LocationData> onLocationChanged() {
    return _location.onLocationChanged;
  }

  Future<ApiResult<RouteResponse>> getRoute(LatLng start, LatLng end) async {
    try {
      final response = await mapRemoteDataSource.getRoute(
          orsApiKey,
          "${start.longitude},${start.latitude}",
          "${end.longitude},${end.latitude}");
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
