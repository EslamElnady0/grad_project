import 'package:json_annotation/json_annotation.dart';

part 'submit_quiz_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SubmitQuizResponse {
  final int code;
  final String data;

  SubmitQuizResponse({required this.code, required this.data});

  factory SubmitQuizResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitQuizResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitQuizResponseToJson(this);
}
