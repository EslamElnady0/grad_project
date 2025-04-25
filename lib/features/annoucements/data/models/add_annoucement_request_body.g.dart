// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_annoucement_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementRequestBody _$AnnouncementRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AnnouncementRequestBody(
      departmentId: json['department_id'] as String,
      semesterId: json['semester_id'] as String,
      courseId: json['course_id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      date: json['date'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$AnnouncementRequestBodyToJson(
        AnnouncementRequestBody instance) =>
    <String, dynamic>{
      'department_id': instance.departmentId,
      'semester_id': instance.semesterId,
      'course_id': instance.courseId,
      'title': instance.title,
      'body': instance.body,
      if (instance.date case final value?) 'date': value,
      if (instance.time case final value?) 'time': value,
    };
