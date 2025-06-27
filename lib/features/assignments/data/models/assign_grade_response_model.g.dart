// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assign_grade_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignGradeResponseModel _$AssignGradeResponseModelFromJson(
        Map<String, dynamic> json) =>
    AssignGradeResponseModel(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$AssignGradeResponseModelToJson(
        AssignGradeResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
