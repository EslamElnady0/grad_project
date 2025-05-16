// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_halls_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHallsResponse _$GetHallsResponseFromJson(Map<String, dynamic> json) =>
    GetHallsResponse(
      code: (json['code'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => HallData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetHallsResponseToJson(GetHallsResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

HallData _$HallDataFromJson(Map<String, dynamic> json) => HallData(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      floor: (json['floor'] as num).toInt(),
      audience: (json['audience'] as num).toInt(),
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      building: Building.fromJson(json['building'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HallDataToJson(HallData instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'status': instance.status,
      'floor': instance.floor,
      'audience': instance.audience,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'building': instance.building,
    };

Building _$BuildingFromJson(Map<String, dynamic> json) => Building(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$BuildingToJson(Building instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };
