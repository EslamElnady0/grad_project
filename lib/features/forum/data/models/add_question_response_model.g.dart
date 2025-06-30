// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_question_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddQuestionResponseModel _$AddQuestionResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddQuestionResponseModel(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$AddQuestionResponseModelToJson(
        AddQuestionResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
