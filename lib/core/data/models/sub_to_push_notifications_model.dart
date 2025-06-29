import 'package:json_annotation/json_annotation.dart';
part 'sub_to_push_notifications_model.g.dart';

@JsonSerializable()
class SubToPushNotificationsModel {
  final String userId;
  @JsonKey(name: 'token')
  final String deviceToken;
  final String platform;

  SubToPushNotificationsModel({
    required this.userId,
    required this.deviceToken,
    this.platform = "android",
  });
  factory SubToPushNotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$SubToPushNotificationsModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubToPushNotificationsModelToJson(this);
}
