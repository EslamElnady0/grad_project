// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_quizzes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQuizzesResponse _$GetQuizzesResponseFromJson(Map<String, dynamic> json) =>
    GetQuizzesResponse(
      code: (json['code'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => QuizModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetQuizzesResponseToJson(GetQuizzesResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) => QuizModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      totalDegree: (json['total_degree'] as num).toInt(),
      date: json['date'] as String,
      startTime: json['start_time'] as String,
      duration: (json['duration'] as num).toInt(),
      status: json['status'] as String,
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
      teacher: json['teacher'] as String,
    );

Map<String, dynamic> _$QuizModelToJson(QuizModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'total_degree': instance.totalDegree,
      'date': instance.date,
      'start_time': instance.startTime,
      'duration': instance.duration,
      'status': instance.status,
      'course': instance.course,
      'teacher': instance.teacher,
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
