// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_assignment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAssignmentResponseModel _$CreateAssignmentResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreateAssignmentResponseModel(
      code: json['code'],
      message: json['message'] as String,
    );

Map<String, dynamic> _$CreateAssignmentResponseModelToJson(
        CreateAssignmentResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
