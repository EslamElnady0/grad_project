// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_assignment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteAssignmentResponseModel _$DeleteAssignmentResponseModelFromJson(
        Map<String, dynamic> json) =>
    DeleteAssignmentResponseModel(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$DeleteAssignmentResponseModelToJson(
        DeleteAssignmentResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
