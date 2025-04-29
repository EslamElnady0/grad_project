import 'package:json_annotation/json_annotation.dart';

part 'teachers_courses_response.g.dart';

@JsonSerializable()
class TeachersCoursesResponse {
  final int code;
  final List<CourseResponse> data;

  TeachersCoursesResponse({
    required this.code,
    required this.data,
  });

  factory TeachersCoursesResponse.fromJson(Map<String, dynamic> json) =>
      _$TeachersCoursesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TeachersCoursesResponseToJson(this);
}

@JsonSerializable()
class CourseResponse {
  final int? id;
  final String? name;
  final String? code;
  final String? description;
  final Department? department;
  final Semester? semester;

  CourseResponse({
    this.id,
    this.name,
    this.code,
    this.description,
    this.department,
    this.semester,
  });

  factory CourseResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseResponseToJson(this);
}

@JsonSerializable()
class Department {
  final int id;
  final String? name;
  final String? description;
  final dynamic teachers;

  @JsonKey(name: 'courses_count')
  final dynamic coursesCount;

  @JsonKey(name: 'students_count')
  final dynamic studentsCount;

  Department({
    required this.id,
    required this.name,
    required this.description,
    this.teachers,
    this.coursesCount,
    this.studentsCount,
  });

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}

@JsonSerializable()
class Semester {
  final int id;
  final String? name;

  Semester({
    required this.id,
    required this.name,
  });

  factory Semester.fromJson(Map<String, dynamic> json) =>
      _$SemesterFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterToJson(this);
}
