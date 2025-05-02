import 'package:json_annotation/json_annotation.dart';

part 'get_quiz_using_id_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetQuizByIdResponse {
  final int code;
  final QuizModel data;

  GetQuizByIdResponse({required this.code, required this.data});

  factory GetQuizByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetQuizByIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetQuizByIdResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class QuizModel {
  final int id;
  final String title;
  final String description;
  @JsonKey(name: 'total_degree')
  final int totalDegree;
  final String date;
  @JsonKey(name: 'start_time')
  final String startTime;
  final int duration;
  final String status;
  final Course course;
  final String teacher;
  final List<Question> questions;

  QuizModel({
    required this.id,
    required this.title,
    required this.description,
    required this.totalDegree,
    required this.date,
    required this.startTime,
    required this.duration,
    required this.status,
    required this.course,
    required this.teacher,
    required this.questions,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuizModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Course {
  final int id;
  final String name;

  Course({required this.id, required this.name});

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Question {
  final int id;
  final String question;
  final List<Answer> answers;

  Question({
    required this.id,
    required this.question,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Answer {
  final int id;
  final String answer;
  final int correct;

  Answer({
    required this.id,
    required this.answer,
    required this.correct,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
