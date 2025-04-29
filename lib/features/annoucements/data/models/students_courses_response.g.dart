// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../core/data/models/students_courses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentsCoursesResponse _$StudentsCoursesResponseFromJson(
        Map<String, dynamic> json) =>
    StudentsCoursesResponse(
      code: (json['code'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map(
              (e) => StudentsCourseResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentsCoursesResponseToJson(
        StudentsCoursesResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

StudentsCourseResponse _$StudentsCourseResponseFromJson(
        Map<String, dynamic> json) =>
    StudentsCourseResponse(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      description: json['description'] as String,
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      semester: Semester.fromJson(json['semester'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentsCourseResponseToJson(
        StudentsCourseResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'department': instance.department,
      'semester': instance.semester,
    };

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Semester _$SemesterFromJson(Map<String, dynamic> json) => Semester(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$SemesterToJson(Semester instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
