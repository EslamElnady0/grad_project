// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_course_material_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCourseMaterialResponseModel _$DeleteCourseMaterialResponseModelFromJson(
        Map<String, dynamic> json) =>
    DeleteCourseMaterialResponseModel(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$DeleteCourseMaterialResponseModelToJson(
        DeleteCourseMaterialResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
