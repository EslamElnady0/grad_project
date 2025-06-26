import 'package:json_annotation/json_annotation.dart';

part 'create_quiz_response_model.g.dart';

// Model class for parsing a quiz creation API response
@JsonSerializable(explicitToJson: true)
class QuizResponseModel {
  final int code;
  final String message;
  final QuizDataModel data;

  QuizResponseModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory QuizResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuizResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuizResponseModelToJson(this);
}

// Model class for the quiz data object
@JsonSerializable(explicitToJson: true)
class QuizDataModel {
  final int id;
  final String title;
  final String description;

  @JsonKey(name: 'total_degree')
  final String totalDegree;

  final String date;

  @JsonKey(name: 'start_time')
  final String startTime;

  final String duration;

  final String? status;
  final CourseModel course;
  final String teacher;

  QuizDataModel({
    required this.id,
    required this.title,
    required this.description,
    required this.totalDegree,
    required this.date,
    required this.startTime,
    required this.duration,
    this.status,
    required this.course,
    required this.teacher,
  });

  factory QuizDataModel.fromJson(Map<String, dynamic> json) =>
      _$QuizDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuizDataModelToJson(this);
}

// Model class for the course object
@JsonSerializable()
class CourseModel {
  final dynamic id;
  final String name;

  CourseModel({
    this.id,
    required this.name,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}
