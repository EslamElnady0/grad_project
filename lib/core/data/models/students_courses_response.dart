import 'package:json_annotation/json_annotation.dart';

part 'students_courses_response.g.dart';

@JsonSerializable()
class StudentsCoursesResponse {
  final int code;
  final List<StudentsCourseResponse> data;

  StudentsCoursesResponse({
    required this.code,
    required this.data,
  });

  factory StudentsCoursesResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentsCoursesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentsCoursesResponseToJson(this);
}

@JsonSerializable()
class StudentsCourseResponse {
  final int id;
  final String name;
  final String code;
  final String description;
  final Department department;
  final Semester semester;

  StudentsCourseResponse({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
    required this.department,
    required this.semester,
  });

  factory StudentsCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentsCourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentsCourseResponseToJson(this);
}

@JsonSerializable()
class Department {
  final int id;
  final String name;

  Department({
    required this.id,
    required this.name,
  });

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}

@JsonSerializable()
class Semester {
  final int id;
  final String name;

  Semester({
    required this.id,
    required this.name,
  });

  factory Semester.fromJson(Map<String, dynamic> json) =>
      _$SemesterFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterToJson(this);
}
