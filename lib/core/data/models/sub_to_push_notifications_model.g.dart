// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_to_push_notifications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubToPushNotificationsModel _$SubToPushNotificationsModelFromJson(
        Map<String, dynamic> json) =>
    SubToPushNotificationsModel(
      userId: json['userId'] as String,
      deviceToken: json['token'] as String,
      platform: json['platform'] as String? ?? "android",
    );

Map<String, dynamic> _$SubToPushNotificationsModelToJson(
        SubToPushNotificationsModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'token': instance.deviceToken,
      'platform': instance.platform,
    };
