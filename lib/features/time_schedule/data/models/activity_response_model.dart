import 'package:freezed_annotation/freezed_annotation.dart';
part 'activity_response_model.g.dart';

@JsonSerializable()
class ActivityModel {
  final int id;
  final String title;
  final String description;
  @JsonKey(name: "total_degree")
  final int totalDegree;
  final String status;
  final String date;
  final Course course;
  final String teacher;

  ActivityModel({
    required this.id,
    required this.title,
    required this.description,
    required this.totalDegree,
    required this.status,
    required this.course,
    required this.teacher,
    required this.date,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);
}

@JsonSerializable()
class Course {
  final int id;
  final String name;

  Course({required this.id, required this.name});

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

@JsonSerializable()
class StudentQuizModel extends ActivityModel {
  @JsonKey(name: "start_time")
  final String time;
  final int duration;

  StudentQuizModel({
    required super.id,
    required super.title,
    required super.description,
    required super.totalDegree,
    required super.status,
    required super.course,
    required super.teacher,
    required super.date,
    required this.time,
    required this.duration,
  });

  factory StudentQuizModel.fromJson(Map<String, dynamic> json) =>
      _$StudentQuizModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentQuizModelToJson(this);
}

@JsonSerializable()
class StudentAssignmentModel extends ActivityModel {
  final String time;
  final String file;

  StudentAssignmentModel({
    required super.id,
    required super.title,
    required super.description,
    required super.totalDegree,
    required super.status,
    required super.date,
    required super.course,
    required super.teacher,
    required this.time,
    required this.file,
  });

  factory StudentAssignmentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentAssignmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentAssignmentModelToJson(this);
}

@JsonSerializable()
class StudentQuizResponseModel {
  final int code;
  final List<StudentQuizModel> data;

  StudentQuizResponseModel({required this.code, required this.data});

  factory StudentQuizResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StudentQuizResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentQuizResponseModelToJson(this);
}

@JsonSerializable()
class StudentAssignmentResponseModel {
  final int code;
  final List<StudentAssignmentModel> data;

  StudentAssignmentResponseModel({required this.code, required this.data});

  factory StudentAssignmentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StudentAssignmentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentAssignmentResponseModelToJson(this);
}
