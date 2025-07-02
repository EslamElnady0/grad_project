// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_session_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateSessionResponseModel _$UpdateSessionResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdateSessionResponseModel(
      message: json['message'] as String,
      originalSession: OriginalSessionModel.fromJson(
          json['original_session'] as Map<String, dynamic>),
      postponedSession: PostponedSessionModel.fromJson(
          json['postponed_session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateSessionResponseModelToJson(
        UpdateSessionResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'original_session': instance.originalSession,
      'postponed_session': instance.postponedSession,
    };

OriginalSessionModel _$OriginalSessionModelFromJson(
        Map<String, dynamic> json) =>
    OriginalSessionModel(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      courseId: (json['course_id'] as num).toInt(),
      departmentId: (json['department_id'] as num).toInt(),
      semesterId: (json['semester_id'] as num).toInt(),
      hallId: (json['hall_id'] as num).toInt(),
      attendance: json['attendance'] as String,
      day: json['day'] as String,
      from: json['from'] as String,
      to: json['to'] as String,
      status: json['status'] as String,
      week: (json['week'] as num).toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$OriginalSessionModelToJson(
        OriginalSessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'course_id': instance.courseId,
      'department_id': instance.departmentId,
      'semester_id': instance.semesterId,
      'hall_id': instance.hallId,
      'attendance': instance.attendance,
      'day': instance.day,
      'from': instance.from,
      'to': instance.to,
      'status': instance.status,
      'week': instance.week,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'date': instance.date,
    };

PostponedSessionModel _$PostponedSessionModelFromJson(
        Map<String, dynamic> json) =>
    PostponedSessionModel(
      id: (json['id'] as num).toInt(),
      sessionId: (json['session_id'] as num).toInt(),
      date: json['date'] as String,
      day: json['day'] as String,
      from: json['from'] as String,
      to: json['to'] as String,
      hallId: (json['hall_id'] as num).toInt(),
      attendance: json['attendance'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$PostponedSessionModelToJson(
        PostponedSessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'session_id': instance.sessionId,
      'date': instance.date,
      'day': instance.day,
      'from': instance.from,
      'to': instance.to,
      'hall_id': instance.hallId,
      'attendance': instance.attendance,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
