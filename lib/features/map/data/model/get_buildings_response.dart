import 'package:json_annotation/json_annotation.dart';

part 'get_buildings_response.g.dart';

@JsonSerializable()
class GetBuildingsResponse {
  final int code;
  final List<BuildingModel> data;

  GetBuildingsResponse({
    required this.code,
    required this.data,
  });

  factory GetBuildingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBuildingsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetBuildingsResponseToJson(this);
}

@JsonSerializable()
class BuildingModel {
  final int id;
  final String name;
  final String code;
  final String latitude;
  final String longitude;

  BuildingModel({
    required this.id,
    required this.name,
    required this.code,
    required this.latitude,
    required this.longitude,
  });

  factory BuildingModel.fromJson(Map<String, dynamic> json) =>
      _$BuildingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BuildingModelToJson(this);
}
