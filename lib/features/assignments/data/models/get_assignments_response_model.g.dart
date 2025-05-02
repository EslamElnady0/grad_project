// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_assignments_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAssignmentsResponseModel _$GetAssignmentsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAssignmentsResponseModel(
      code: (json['code'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => AssignmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAssignmentsResponseModelToJson(
        GetAssignmentsResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

AssignmentModel _$AssignmentModelFromJson(Map<String, dynamic> json) =>
    AssignmentModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      totalDegree: (json['total_degree'] as num).toInt(),
      date: json['date'] as String,
      time: json['time'] as String,
      status: json['status'] as String,
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
      teacher: json['teacher'] as String?,
      file: json['file'] as String,
    );

Map<String, dynamic> _$AssignmentModelToJson(AssignmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'total_degree': instance.totalDegree,
      'date': instance.date,
      'time': instance.time,
      'status': instance.status,
      'course': instance.course,
      'teacher': instance.teacher,
      'file': instance.file,
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
