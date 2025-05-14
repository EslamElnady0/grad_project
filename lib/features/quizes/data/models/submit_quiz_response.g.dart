// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_quiz_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitQuizResponse _$SubmitQuizResponseFromJson(Map<String, dynamic> json) =>
    SubmitQuizResponse(
      code: (json['code'] as num).toInt(),
      data: json['data'] as String,
    );

Map<String, dynamic> _$SubmitQuizResponseToJson(SubmitQuizResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };
