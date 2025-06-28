// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment_answer_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentAssignmentAnswerModel _$StudentAssignmentAnswerModelFromJson(
        Map<String, dynamic> json) =>
    StudentAssignmentAnswerModel(
      code: (json['code'] as num).toInt(),
      data: AssignmentAnswerDetailsModel.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentAssignmentAnswerModelToJson(
        StudentAssignmentAnswerModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

AssignmentAnswerDetailsModel _$AssignmentAnswerDetailsModelFromJson(
        Map<String, dynamic> json) =>
    AssignmentAnswerDetailsModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      totalDegree: (json['total_degree'] as num).toInt(),
      date: json['date'] as String,
      time: json['time'] as String,
      status: json['status'] as String,
      teacher: json['teacher'] as String,
      file: json['file'] as String,
      answerStatus:
          AnswerStatus.fromJson(json['answer_status'] as Map<String, dynamic>),
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssignmentAnswerDetailsModelToJson(
        AssignmentAnswerDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'total_degree': instance.totalDegree,
      'date': instance.date,
      'time': instance.time,
      'status': instance.status,
      'teacher': instance.teacher,
      'file': instance.file,
      'answer_status': instance.answerStatus,
      'course': instance.course,
    };

AnswerStatus _$AnswerStatusFromJson(Map<String, dynamic> json) => AnswerStatus(
      status: json['status'] as String,
      degree: (json['degree'] as num).toInt(),
      file: json['file'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$AnswerStatusToJson(AnswerStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'degree': instance.degree,
      'file': instance.file,
      'created_at': instance.createdAt,
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
