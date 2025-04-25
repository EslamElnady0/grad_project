// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_annoucement_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAnnouncementRequestBody _$AddAnnouncementRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AddAnnouncementRequestBody(
      departmentId: (json['department_id'] as num).toInt(),
      semesterId: (json['semester_id'] as num).toInt(),
      courseId: (json['course_id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      date: json['date'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$AddAnnouncementRequestBodyToJson(
        AddAnnouncementRequestBody instance) =>
    <String, dynamic>{
      'department_id': instance.departmentId,
      'semester_id': instance.semesterId,
      'course_id': instance.courseId,
      'title': instance.title,
      'body': instance.body,
      if (instance.date case final value?) 'date': value,
      if (instance.time case final value?) 'time': value,
    };
