import 'package:json_annotation/json_annotation.dart';
part 'assignment_answer_details_model.g.dart';
@JsonSerializable()
class StudentAssignmentAnswerModel {
  int code;
  AssignmentAnswerDetailsModel data;

  StudentAssignmentAnswerModel({
    required this.code,
    required this.data,
  });

  factory StudentAssignmentAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$StudentAssignmentAnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentAssignmentAnswerModelToJson(this);
}

@JsonSerializable()
class AssignmentAnswerDetailsModel {
  final int id;
  final String title;
  final String description;
  @JsonKey(name: 'total_degree')
  final int totalDegree;
  final String date;
  final String time;
  final String status;
  final String teacher;
  final String file;
  @JsonKey(name: 'answer_status')
  final AnswerStatus? answerStatus;
  final Course course;

  AssignmentAnswerDetailsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.totalDegree,
    required this.date,
    required this.time,
    required this.status,
    required this.teacher,
    required this.file,
    required this.answerStatus,
    required this.course,
  });

  factory AssignmentAnswerDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AssignmentAnswerDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$AssignmentAnswerDetailsModelToJson(this);
}

@JsonSerializable()
class AnswerStatus {
  final String status;
  final int degree;
  final String file;
  @JsonKey(name: 'created_at')
  final String createdAt;

  AnswerStatus({
    required this.status,
    required this.degree,
    required this.file,
    required this.createdAt,
  });

  factory AnswerStatus.fromJson(Map<String, dynamic> json) =>
      _$AnswerStatusFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerStatusToJson(this);
}

@JsonSerializable()
class Course {
  final int id;
  final String name;

  Course({
    required this.id,
    required this.name,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
