import 'package:json_annotation/json_annotation.dart';
part 'submit_quiz_request_body.g.dart';

@JsonSerializable(explicitToJson: true)
class SubmitQuizRequestBody {
  List<QuestionSubmitionModel> questions;

  SubmitQuizRequestBody({required this.questions});

  factory SubmitQuizRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SubmitQuizRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitQuizRequestBodyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class QuestionSubmitionModel {
  @JsonKey(name: 'question')
  final String questionId;

  @JsonKey(name: 'answer')
  final String answerId;

  QuestionSubmitionModel({
    required this.questionId,
    required this.answerId,
  });

  factory QuestionSubmitionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionSubmitionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionSubmitionModelToJson(this);
}
