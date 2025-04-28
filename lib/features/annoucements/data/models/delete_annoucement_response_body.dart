import 'package:json_annotation/json_annotation.dart';

part 'delete_annoucement_response_body.g.dart';

@JsonSerializable()
class DeleteAnnoucementResponseBody {
  final int code;
  final String message;

  DeleteAnnoucementResponseBody({
    required this.code,
    required this.message,
  });

  factory DeleteAnnoucementResponseBody.fromJson(Map<String, dynamic> json) =>
      _$DeleteAnnoucementResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteAnnoucementResponseBodyToJson(this);
}
