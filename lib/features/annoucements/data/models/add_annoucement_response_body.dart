import 'package:json_annotation/json_annotation.dart';

part 'add_annoucement_response_body.g.dart';

@JsonSerializable()
class SimpleResponseBody {
  final dynamic code;
  final String message;

  SimpleResponseBody({
    required this.code,
    required this.message,
  });

  factory SimpleResponseBody.fromJson(Map<String, dynamic> json) =>
      _$SimpleResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleResponseBodyToJson(this);
}
