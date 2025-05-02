import 'package:json_annotation/json_annotation.dart';

part 'get_assignments_response_model.g.dart';

@JsonSerializable()
class GetAssignmentsResponseModel {
  final int code;
  final List<AssignmentModel> data;

  GetAssignmentsResponseModel({required this.code, required this.data});

  factory GetAssignmentsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetAssignmentsResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetAssignmentsResponseModelToJson(this);
}

@JsonSerializable()
class AssignmentModel {
  final int id;
  final String title;
  final String description;
  @JsonKey(name: 'total_degree')
  final int totalDegree;
  final String date;
  final String time;
  final String status;
  final Course course;
  final String? teacher;
  final String file;

  AssignmentModel({
    required this.id,
    required this.title,
    required this.description,
    required this.totalDegree,
    required this.date,
    required this.time,
    required this.status,
    required this.course,
    required this.teacher,
    required this.file,
  });

  factory AssignmentModel.fromJson(Map<String, dynamic> json) =>
      _$AssignmentModelFromJson(json);
  Map<String, dynamic> toJson() => _$AssignmentModelToJson(this);
}

@JsonSerializable()
class Course {
  final int id;
  final String name;

  Course({required this.id, required this.name});

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
