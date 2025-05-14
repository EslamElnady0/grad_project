// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileResponseModel _$UpdateProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileResponseModel(
      message: json['message'] as String,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$UpdateProfileResponseModelToJson(
        UpdateProfileResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
    };
