import 'package:grad_project/features/quizes/data/models/get_quiz_using_id_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'submit_quiz_request_body.g.dart';

@JsonSerializable(explicitToJson: true)
class SubmitQuizRequestBody {
  List<QuestionModel> questions;

  SubmitQuizRequestBody({required this.questions});

  factory SubmitQuizRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SubmitQuizRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitQuizRequestBodyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class QuestionModel {
  final String question;
  final List<Answer> answers;

  QuestionModel({
    required this.question,
    required this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnswerModel {
  final String answer;
  final int correct;

  AnswerModel({
    required this.answer,
    required this.correct,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}
