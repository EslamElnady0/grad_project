import 'package:json_annotation/json_annotation.dart';

part 'create_quiz_request_model.g.dart';

@JsonSerializable(explicitToJson: true)
class QuizRequestModel {
  @JsonKey(name: 'course_id')
  final String courseId;

  final String title;

  final String description;

  @JsonKey(name: 'total_degree')
  final String totalDegree;
  @JsonKey(name: 'question_degree')
  final String questionDegree;

  final String date;

  @JsonKey(name: 'start_time')
  final String startTime;

  final String duration;

  @JsonKey(name: 'new_questions')
  final List<QuestionModel> newQuestions;

  QuizRequestModel({
    required this.courseId,
    required this.questionDegree,
    required this.title,
    required this.description,
    required this.totalDegree,
    required this.date,
    required this.startTime,
    required this.duration,
    required this.newQuestions,
  });

  factory QuizRequestModel.fromJson(Map<String, dynamic> json) =>
      _$QuizRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuizRequestModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class QuestionModel {
  final String question;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.question,
    required this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}

@JsonSerializable()
class AnswerModel {
  final String answer;

  @JsonKey(name: 'is_correct')
  final int isCorrect;

  AnswerModel({
    required this.answer,
    required this.isCorrect,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}
