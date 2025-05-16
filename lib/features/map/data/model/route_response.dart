import 'package:latlong2/latlong.dart';

class RouteResponse {
  final List<LatLng> routePoints;
  final List<RouteInstruction> instructions;
  final double distance;
  final double duration;
  RouteResponse({
    required this.routePoints,
    required this.instructions,
    required this.distance,
    required this.duration,
  });

  factory RouteResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> coords = json['features'][0]['geometry']['coordinates'];
    final List<LatLng> routePoints =
        coords.map((coord) => LatLng(coord[1], coord[0])).toList();
    final double duration =
        (json['features'][0]['properties']["segments"][0]['duration'] as num)
            .toDouble();
    final double distance =
        (json['features'][0]['properties']["segments"][0]['distance'] as num)
            .toDouble();
    final List<dynamic> steps =
        json['features'][0]['properties']['segments'][0]['steps'];
    final List<RouteInstruction> instructions = steps.map((step) {
      return RouteInstruction.fromJson(step);
    }).toList();

    return RouteResponse(
      routePoints: routePoints,
      instructions: instructions,
      distance: distance,
      duration: duration,
    );
  }
}

class RouteInstruction {
  final String instruction;
  final double distance;
  final double duration;
  final String name;

  RouteInstruction({
    required this.instruction,
    required this.distance,
    required this.duration,
    required this.name,
  });

  factory RouteInstruction.fromJson(Map<String, dynamic> json) {
    return RouteInstruction(
      instruction: json['instruction'] as String,
      distance: (json['distance'] as num).toDouble(),
      duration: (json['duration'] as num).toDouble(),
      name: json['name'] as String,
    );
  }
}
