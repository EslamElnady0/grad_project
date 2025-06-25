// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_parking_slots_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetParkingSlotsResponse _$GetParkingSlotsResponseFromJson(
        Map<String, dynamic> json) =>
    GetParkingSlotsResponse(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ParkingSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetParkingSlotsResponseToJson(
        GetParkingSlotsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

ParkingSlot _$ParkingSlotFromJson(Map<String, dynamic> json) => ParkingSlot(
      userId: json['userId'] as String?,
      endTime: json['endTime'] as String?,
      id: json['id'] as String,
      spotState: json['spotState'] as String,
      spotNumber: (json['spotNumber'] as num).toInt(),
    );

Map<String, dynamic> _$ParkingSlotToJson(ParkingSlot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'spotState': instance.spotState,
      'spotNumber': instance.spotNumber,
      'userId': instance.userId,
      'endTime': instance.endTime,
    };
