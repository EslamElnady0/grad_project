// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_courses_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCoursesResponseModel _$AllCoursesResponseModelFromJson(
        Map<String, dynamic> json) =>
    AllCoursesResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CourseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllCoursesResponseModelToJson(
        AllCoursesResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

CourseData _$CourseDataFromJson(Map<String, dynamic> json) => CourseData(
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

Map<String, dynamic> _$CourseDataToJson(CourseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'department': instance.department,
      'semester': instance.semester,
    };

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Semester _$SemesterFromJson(Map<String, dynamic> json) => Semester(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SemesterToJson(Semester instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
