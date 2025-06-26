import 'package:freezed_annotation/freezed_annotation.dart';
part 'assignment_answers_model.g.dart';

@JsonSerializable()
class AssignmentAnswersModel {
  final int code;
  final AssignmentDetails data;

  AssignmentAnswersModel({required this.code, required this.data});
  factory AssignmentAnswersModel.fromJson(Map<String, dynamic> json) =>
      _$AssignmentAnswersModelFromJson(json);
  Map<String, dynamic> toJson() => _$AssignmentAnswersModelToJson(this);
}

@JsonSerializable()
class AssignmentDetails {
  final int id;
  final String title;
  final String description;
  @JsonKey(name: 'total_degree')
  final int totalDegree;
  final String date;
  final String time;
  final String status;
  final String teacher;
  @JsonKey(name: 'file')
  final String fileUrl;
  final List<Answer> answers;
  final Course course;

  AssignmentDetails({
    required this.id,
    required this.title,
    required this.description,
    required this.totalDegree,
    required this.date,
    required this.time,
    required this.status,
    required this.teacher,
    required this.fileUrl,
    required this.answers,
    required this.course,
  });

  factory AssignmentDetails.fromJson(Map<String, dynamic> json) =>
      _$AssignmentDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$AssignmentDetailsToJson(this);
}

@JsonSerializable()
class Answer {
  final int id;
  final String student;
  final String code;
  final String status;
  final int degree;
  @JsonKey(name: 'file')
  final String fileUrl;
  @JsonKey(name: 'created_at')
  final String createdAt;

  Answer({
    required this.id,
    required this.student,
    required this.code,
    required this.status,
    required this.degree,
    required this.fileUrl,
    required this.createdAt,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}

@JsonSerializable()
class Course {
  final int id;
  final String name;

  Course({required this.id, required this.name});

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
