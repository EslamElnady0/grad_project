import 'package:json_annotation/json_annotation.dart';

part 'update_session_request_model.g.dart';

@JsonSerializable()
class UpdateSessionRequestModel {
  final String day;
  final String date;
  final String from;
  final String to;
  final String attendance;


  UpdateSessionRequestModel({
    required this.day,
    required this.date,
    required this.from,
    required this.to,
    required this.attendance,

  });

  factory UpdateSessionRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateSessionRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateSessionRequestModelToJson(this);
}
