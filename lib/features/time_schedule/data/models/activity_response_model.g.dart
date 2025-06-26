// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    ActivityModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      totalDegree: (json['total_degree'] as num).toInt(),
      status: json['status'] as String,
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
      teacher: json['teacher'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'total_degree': instance.totalDegree,
      'status': instance.status,
      'date': instance.date,
      'course': instance.course,
      'teacher': instance.teacher,
    };

StudentQuizModel _$StudentQuizModelFromJson(Map<String, dynamic> json) =>
    StudentQuizModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      totalDegree: (json['total_degree'] as num).toInt(),
      status: json['status'] as String,
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
      teacher: json['teacher'] as String,
      date: json['date'] as String,
      time: json['start_time'] as String,
      duration: (json['duration'] as num).toInt(),
    );

Map<String, dynamic> _$StudentQuizModelToJson(StudentQuizModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'total_degree': instance.totalDegree,
      'status': instance.status,
      'date': instance.date,
      'course': instance.course,
      'teacher': instance.teacher,
      'start_time': instance.time,
      'duration': instance.duration,
    };

StudentAssignmentModel _$StudentAssignmentModelFromJson(
        Map<String, dynamic> json) =>
    StudentAssignmentModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      totalDegree: (json['total_degree'] as num).toInt(),
      status: json['status'] as String,
      date: json['date'] as String,
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
      teacher: json['teacher'] as String,
      time: json['time'] as String,
      file: json['file'] as String,
    );

Map<String, dynamic> _$StudentAssignmentModelToJson(
        StudentAssignmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'total_degree': instance.totalDegree,
      'status': instance.status,
      'date': instance.date,
      'course': instance.course,
      'teacher': instance.teacher,
      'time': instance.time,
      'file': instance.file,
    };

StudentQuizResponseModel _$StudentQuizResponseModelFromJson(
        Map<String, dynamic> json) =>
    StudentQuizResponseModel(
      code: (json['code'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => StudentQuizModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentQuizResponseModelToJson(
        StudentQuizResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

StudentAssignmentResponseModel _$StudentAssignmentResponseModelFromJson(
        Map<String, dynamic> json) =>
    StudentAssignmentResponseModel(
      code: (json['code'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map(
              (e) => StudentAssignmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentAssignmentResponseModelToJson(
        StudentAssignmentResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };
