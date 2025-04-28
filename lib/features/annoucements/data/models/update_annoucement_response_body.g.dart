// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_annoucement_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAnnoucementResponseBody _$UpdateAnnoucementResponseBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateAnnoucementResponseBody(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : UpdateData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateAnnoucementResponseBodyToJson(
        UpdateAnnoucementResponseBody instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

UpdateData _$UpdateDataFromJson(Map<String, dynamic> json) => UpdateData(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      departmentId: (json['department_id'] as num).toInt(),
      semesterId: (json['semester_id'] as num).toInt(),
      courseId: (json['course_id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      postIn: DateTime.parse(json['post_in'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      courseDetailsId: json['course_details_id'] as String,
    );

Map<String, dynamic> _$UpdateDataToJson(UpdateData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'department_id': instance.departmentId,
      'semester_id': instance.semesterId,
      'course_id': instance.courseId,
      'title': instance.title,
      'body': instance.body,
      'post_in': instance.postIn.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'course_details_id': instance.courseDetailsId,
    };
