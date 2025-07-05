// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_table_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTableResponseModel _$GetTableResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetTableResponseModel(
      code: (json['code'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => TableResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetTableResponseModelToJson(
        GetTableResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

TableResponse _$TableResponseFromJson(Map<String, dynamic> json) =>
    TableResponse(
      department: json['department'] as String,
      departmentId: (json['department_id'] as num).toInt(),
      semester: (json['semester'] as num).toInt(),
      sessions: (json['sessions'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => SessionResponse.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$TableResponseToJson(TableResponse instance) =>
    <String, dynamic>{
      'department': instance.department,
      'department_id': instance.departmentId,
      'semester': instance.semester,
      'sessions': instance.sessions,
    };

SessionResponse _$SessionResponseFromJson(Map<String, dynamic> json) =>
    SessionResponse(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      course: json['course'] as String,
      hall: HallResponse.fromJson(json['hall'] as Map<String, dynamic>),
      attendance: json['attendance'] as String,
      day: json['day'] as String,
      from: json['from'] as String,
      to: json['to'] as String,
      status: json['status'] as String,
      postponed: json['postponed'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$SessionResponseToJson(SessionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'course': instance.course,
      'hall': instance.hall,
      'attendance': instance.attendance,
      'day': instance.day,
      'from': instance.from,
      'to': instance.to,
      'status': instance.status,
      'postponed': instance.postponed,
    };

HallResponse _$HallResponseFromJson(Map<String, dynamic> json) => HallResponse(
      hallId: (json['hall_id'] as num).toInt(),
      hallName: json['hall_name'] as String,
      hallCode: json['hall_code'] as String,
      building: json['building'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );

Map<String, dynamic> _$HallResponseToJson(HallResponse instance) =>
    <String, dynamic>{
      'hall_id': instance.hallId,
      'hall_name': instance.hallName,
      'hall_code': instance.hallCode,
      'building': instance.building,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
