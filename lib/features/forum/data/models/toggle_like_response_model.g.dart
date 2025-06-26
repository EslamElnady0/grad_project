// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_like_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToggleLikeResponseModel _$ToggleLikeResponseModelFromJson(
        Map<String, dynamic> json) =>
    ToggleLikeResponseModel(
      message: json['message'] as String,
      likes: (json['likes'] as num).toInt(),
    );

Map<String, dynamic> _$ToggleLikeResponseModelToJson(
        ToggleLikeResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'likes': instance.likes,
    };
