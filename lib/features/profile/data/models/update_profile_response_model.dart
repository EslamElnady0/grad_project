import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_profile_response_model.g.dart';


@JsonSerializable()
class UpdateProfileResponseModel {

  final String message;
  final int code;
  UpdateProfileResponseModel({
    required this.message,
    required this.code,
  });

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileResponseModelToJson(this);
}