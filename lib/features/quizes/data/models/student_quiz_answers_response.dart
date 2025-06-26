import 'package:json_annotation/json_annotation.dart';

part 'student_quiz_answers_response.g.dart';

@JsonSerializable()
class StudentQuizAnswersResponse {
  final int code;
  final StudentQuizAnswersData data;

  StudentQuizAnswersResponse({
    required this.code,
    required this.data,
  });

  factory StudentQuizAnswersResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentQuizAnswersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StudentQuizAnswersResponseToJson(this);
}

@JsonSerializable()
class StudentQuizAnswersData {
  final int id;
  final String title;
  final String description;
  @JsonKey(name: 'max_degree')
  final int maxDegree;
  @JsonKey(name: 'student_degree')
  final int studentDegree;
  final String date;
  @JsonKey(name: 'start_time')
  final String startTime;
  final int duration;
  final List<StudentQuizQuestion> questions;

  StudentQuizAnswersData({
    required this.id,
    required this.title,
    required this.description,
    required this.maxDegree,
    required this.studentDegree,
    required this.date,
    required this.startTime,
    required this.duration,
    required this.questions,
  });

  factory StudentQuizAnswersData.fromJson(Map<String, dynamic> json) =>
      _$StudentQuizAnswersDataFromJson(json);
  Map<String, dynamic> toJson() => _$StudentQuizAnswersDataToJson(this);
}

@JsonSerializable()
class StudentQuizQuestion {
  final int id;
  final String question;
  final List<StudentQuizAnswer> answers;
  @JsonKey(name: 'student_answer')
  final int studentAnswer;

  StudentQuizQuestion({
    required this.id,
    required this.question,
    required this.answers,
    required this.studentAnswer,
  });

  factory StudentQuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$StudentQuizQuestionFromJson(json);
  Map<String, dynamic> toJson() => _$StudentQuizQuestionToJson(this);
}

@JsonSerializable()
class StudentQuizAnswer {
  final int id;
  final String answer;
  final int correct;

  StudentQuizAnswer({
    required this.id,
    required this.answer,
    required this.correct,
  });

  factory StudentQuizAnswer.fromJson(Map<String, dynamic> json) =>
      _$StudentQuizAnswerFromJson(json);
  Map<String, dynamic> toJson() => _$StudentQuizAnswerToJson(this);
}
