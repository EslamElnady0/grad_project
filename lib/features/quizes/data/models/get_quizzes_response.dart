import 'package:json_annotation/json_annotation.dart';

part 'get_quizzes_response.g.dart';

@JsonSerializable()
class GetQuizzesResponse {
  final int code;
  final List<QuizModel> data;

  GetQuizzesResponse({required this.code, required this.data});

  factory GetQuizzesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetQuizzesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetQuizzesResponseToJson(this);
}

@JsonSerializable()
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
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuizModelToJson(this);
}

@JsonSerializable()
class Course {
  final int id;
  final String name;

  Course({required this.id, required this.name});

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
