import 'package:json_annotation/json_annotation.dart';

part 'add_annoucement_response_body.g.dart';

@JsonSerializable()
class AddAnnouncementResponseBody {
  final dynamic code;
  final String message;

  AddAnnouncementResponseBody({
    required this.code,
    required this.message,
  });

  factory AddAnnouncementResponseBody.fromJson(Map<String, dynamic> json) =>
      _$AddAnnouncementResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AddAnnouncementResponseBodyToJson(this);
}
