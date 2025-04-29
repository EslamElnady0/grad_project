// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teachers_courses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeachersCoursesResponse _$TeachersCoursesResponseFromJson(
        Map<String, dynamic> json) =>
    TeachersCoursesResponse(
      code: (json['code'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => CourseResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeachersCoursesResponseToJson(
        TeachersCoursesResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

CourseResponse _$CourseResponseFromJson(Map<String, dynamic> json) =>
    CourseResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
      description: json['description'] as String?,
      department: json['department'] == null
          ? null
          : Department.fromJson(json['department'] as Map<String, dynamic>),
      semester: json['semester'] == null
          ? null
          : Semester.fromJson(json['semester'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseResponseToJson(CourseResponse instance) =>
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
      name: json['name'] as String?,
      description: json['description'] as String?,
      teachers: json['teachers'],
      coursesCount: json['courses_count'],
      studentsCount: json['students_count'],
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'teachers': instance.teachers,
      'courses_count': instance.coursesCount,
      'students_count': instance.studentsCount,
    };

Semester _$SemesterFromJson(Map<String, dynamic> json) => Semester(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SemesterToJson(Semester instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
