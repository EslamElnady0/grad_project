// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment_answers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignmentAnswersModel _$AssignmentAnswersModelFromJson(
        Map<String, dynamic> json) =>
    AssignmentAnswersModel(
      code: (json['code'] as num).toInt(),
      data: AssignmentDetails.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssignmentAnswersModelToJson(
        AssignmentAnswersModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

AssignmentDetails _$AssignmentDetailsFromJson(Map<String, dynamic> json) =>
    AssignmentDetails(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      totalDegree: (json['total_degree'] as num).toInt(),
      date: json['date'] as String,
      time: json['time'] as String,
      status: json['status'] as String,
      teacher: json['teacher'] as String,
      fileUrl: json['file'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssignmentDetailsToJson(AssignmentDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'total_degree': instance.totalDegree,
      'date': instance.date,
      'time': instance.time,
      'status': instance.status,
      'teacher': instance.teacher,
      'file': instance.fileUrl,
      'answers': instance.answers,
      'course': instance.course,
    };

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      id: (json['id'] as num).toInt(),
      student: json['student'] as String,
      code: json['code'] as String,
      status: json['status'] as String,
      degree: (json['degree'] as num).toInt(),
      fileUrl: json['file'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'id': instance.id,
      'student': instance.student,
      'code': instance.code,
      'status': instance.status,
      'degree': instance.degree,
      'file': instance.fileUrl,
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
