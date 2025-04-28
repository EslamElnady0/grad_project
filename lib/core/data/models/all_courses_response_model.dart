import 'package:json_annotation/json_annotation.dart';

part 'all_courses_response_model.g.dart';

@JsonSerializable()
class AllCoursesResponseModel {
  int? code;
  List<CourseData>? data;

  AllCoursesResponseModel({this.code, this.data});

  factory AllCoursesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AllCoursesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllCoursesResponseModelToJson(this);
}

@JsonSerializable()
class CourseData {
  int? id;
  String? name;
  String? code;
  String? description;
  Department? department;
  Semester? semester;

  CourseData({
    this.id,
    this.name,
    this.code,
    this.description,
    this.department,
    this.semester,
  });

  factory CourseData.fromJson(Map<String, dynamic> json) =>
      _$CourseDataFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDataToJson(this);
}

@JsonSerializable()
class Department {
  int? id;
  String? name;

  Department({this.id, this.name});

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}

@JsonSerializable()
class Semester {
  int? id;
  String? name;

  Semester({this.id, this.name});

  factory Semester.fromJson(Map<String, dynamic> json) =>
      _$SemesterFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterToJson(this);
}
