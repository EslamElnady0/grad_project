// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_quiz_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizResponseModel _$QuizResponseModelFromJson(Map<String, dynamic> json) =>
    QuizResponseModel(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      data: QuizDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuizResponseModelToJson(QuizResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

QuizDataModel _$QuizDataModelFromJson(Map<String, dynamic> json) =>
    QuizDataModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      totalDegree: json['total_degree'] as String,
      date: json['date'] as String,
      startTime: json['start_time'] as String,
      duration: json['duration'] as String,
      status: json['status'] as String?,
      course: CourseModel.fromJson(json['course'] as Map<String, dynamic>),
      teacher: json['teacher'] as String,
    );

Map<String, dynamic> _$QuizDataModelToJson(QuizDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'total_degree': instance.totalDegree,
      'date': instance.date,
      'start_time': instance.startTime,
      'duration': instance.duration,
      'status': instance.status,
      'course': instance.course.toJson(),
      'teacher': instance.teacher,
    };

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
      id: json['id'],
      name: json['name'] as String,
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
