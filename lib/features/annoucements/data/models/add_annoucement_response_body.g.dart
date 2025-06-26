// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_annoucement_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleResponseBody _$SimpleResponseBodyFromJson(Map<String, dynamic> json) =>
    SimpleResponseBody(
      code: json['code'],
      message: json['message'] as String,
    );

Map<String, dynamic> _$SimpleResponseBodyToJson(SimpleResponseBody instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
