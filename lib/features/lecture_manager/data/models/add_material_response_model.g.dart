// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_material_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddMaterialResponseModel _$AddMaterialResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddMaterialResponseModel(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AddMaterialResponseModelToJson(
        AddMaterialResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
