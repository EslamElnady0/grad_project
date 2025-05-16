// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_buildings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBuildingsResponse _$GetBuildingsResponseFromJson(
        Map<String, dynamic> json) =>
    GetBuildingsResponse(
      code: (json['code'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => BuildingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBuildingsResponseToJson(
        GetBuildingsResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

BuildingModel _$BuildingModelFromJson(Map<String, dynamic> json) =>
    BuildingModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );

Map<String, dynamic> _$BuildingModelToJson(BuildingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
