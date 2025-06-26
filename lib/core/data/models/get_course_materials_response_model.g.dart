// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_course_materials_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCourseMaterialsResponseModel _$GetCourseMaterialsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetCourseMaterialsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CourseMaterialData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCourseMaterialsResponseModelToJson(
        GetCourseMaterialsResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

CourseMaterialData _$CourseMaterialDataFromJson(Map<String, dynamic> json) =>
    CourseMaterialData(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      week: json['week'] as String?,
      file: json['file'] as String?,
      type: json['type'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$CourseMaterialDataToJson(CourseMaterialData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'week': instance.week,
      'file': instance.file,
      'type': instance.type,
      'created_at': instance.createdAt,
    };
