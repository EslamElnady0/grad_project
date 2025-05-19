import 'package:json_annotation/json_annotation.dart';

part 'get_halls_response.g.dart';

@JsonSerializable()
class GetHallsResponse {
  final int code;
  final List<HallData> data;

  GetHallsResponse({
    required this.code,
    required this.data,
  });

  factory GetHallsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetHallsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetHallsResponseToJson(this);
}

@JsonSerializable()
class HallData {
  final int id;
  final String code;
  final String name;
  final String status;
  final int floor;
  final int audience;
  final String latitude;
  final String longitude;
  final Building building;

  HallData({
    required this.id,
    required this.code,
    required this.name,
    required this.status,
    required this.floor,
    required this.audience,
    required this.latitude,
    required this.longitude,
    required this.building,
  });

  factory HallData.fromJson(Map<String, dynamic> json) =>
      _$HallDataFromJson(json);

  Map<String, dynamic> toJson() => _$HallDataToJson(this);
}

@JsonSerializable()
class Building {
  final int id;
  final String name;
  final String code;

  Building({
    required this.id,
    required this.name,
    required this.code,
  });

  factory Building.fromJson(Map<String, dynamic> json) =>
      _$BuildingFromJson(json);

  Map<String, dynamic> toJson() => _$BuildingToJson(this);
}
