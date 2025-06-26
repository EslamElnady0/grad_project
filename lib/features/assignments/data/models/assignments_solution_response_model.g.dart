// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignments_solution_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignmentsSolutionResponseModel _$AssignmentsSolutionResponseModelFromJson(
        Map<String, dynamic> json) =>
    AssignmentsSolutionResponseModel(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$AssignmentsSolutionResponseModelToJson(
        AssignmentsSolutionResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
