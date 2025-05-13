import 'package:json_annotation/json_annotation.dart';

part 'toggle_like_response_model.g.dart';

@JsonSerializable()
class ToggleLikeResponseModel {
  final String message;
  final int likes;

  ToggleLikeResponseModel({
    required this.message,
    required this.likes,
  });

  factory ToggleLikeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ToggleLikeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ToggleLikeResponseModelToJson(this);
}