// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_annoucement_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteAnnoucementResponseBody _$DeleteAnnoucementResponseBodyFromJson(
        Map<String, dynamic> json) =>
    DeleteAnnoucementResponseBody(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$DeleteAnnoucementResponseBodyToJson(
        DeleteAnnoucementResponseBody instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
