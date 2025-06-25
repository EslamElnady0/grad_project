import 'package:json_annotation/json_annotation.dart';

part 'quiz_details_response.g.dart';

@JsonSerializable()
class QuizDetailsResponse {
  final int code;
  final QuizDetailsData data;

  QuizDetailsResponse({
    required this.code,
    required this.data,
  });

  factory QuizDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$QuizDetailsResponseToJson(this);
}

@JsonSerializable()
class QuizDetailsData {
  final int id;
  final String title;
  final String description;
  @JsonKey(name: 'max_degree')
  final int maxDegree;
  final String date;
  @JsonKey(name: 'start_time')
  final String startTime;
  final int duration;
  final List<QuizStudent> students;

  QuizDetailsData({
    required this.id,
    required this.title,
    required this.description,
    required this.maxDegree,
    required this.date,
    required this.startTime,
    required this.duration,
    required this.students,
  });

  factory QuizDetailsData.fromJson(Map<String, dynamic> json) =>
      _$QuizDetailsDataFromJson(json);
  Map<String, dynamic> toJson() => _$QuizDetailsDataToJson(this);
}

@JsonSerializable()
class QuizStudent {
  @JsonKey(name: 'student_id')
  final int studentId;
  @JsonKey(name: 'student_name')
  final String studentName;
  final int degree;

  QuizStudent({
    required this.studentId,
    required this.studentName,
    required this.degree,
  });

  factory QuizStudent.fromJson(Map<String, dynamic> json) =>
      _$QuizStudentFromJson(json);
  Map<String, dynamic> toJson() => _$QuizStudentToJson(this);
}
