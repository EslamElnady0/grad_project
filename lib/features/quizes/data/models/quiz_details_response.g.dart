// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizDetailsResponse _$QuizDetailsResponseFromJson(Map<String, dynamic> json) =>
    QuizDetailsResponse(
      code: (json['code'] as num).toInt(),
      data: QuizDetailsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuizDetailsResponseToJson(
        QuizDetailsResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

QuizDetailsData _$QuizDetailsDataFromJson(Map<String, dynamic> json) =>
    QuizDetailsData(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      maxDegree: (json['max_degree'] as num).toInt(),
      date: json['date'] as String,
      startTime: json['start_time'] as String,
      duration: (json['duration'] as num).toInt(),
      students: (json['students'] as List<dynamic>)
          .map((e) => QuizStudent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizDetailsDataToJson(QuizDetailsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'max_degree': instance.maxDegree,
      'date': instance.date,
      'start_time': instance.startTime,
      'duration': instance.duration,
      'students': instance.students,
    };

QuizStudent _$QuizStudentFromJson(Map<String, dynamic> json) => QuizStudent(
      studentId: (json['student_id'] as num).toInt(),
      studentName: json['student_name'] as String,
      degree: (json['degree'] as num).toInt(),
    );

Map<String, dynamic> _$QuizStudentToJson(QuizStudent instance) =>
    <String, dynamic>{
      'student_id': instance.studentId,
      'student_name': instance.studentName,
      'degree': instance.degree,
    };
