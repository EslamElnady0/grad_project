// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_annoucement_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAnnouncementResponseBody _$AddAnnouncementResponseBodyFromJson(
        Map<String, dynamic> json) =>
    AddAnnouncementResponseBody(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      data: AnnouncementData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddAnnouncementResponseBodyToJson(
        AddAnnouncementResponseBody instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

AnnouncementData _$AnnouncementDataFromJson(Map<String, dynamic> json) =>
    AnnouncementData(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      from: json['from'] as String,
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      semester: Semester.fromJson(json['semester'] as Map<String, dynamic>),
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnnouncementDataToJson(AnnouncementData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'date': instance.date,
      'time': instance.time,
      'from': instance.from,
      'department': instance.department,
      'semester': instance.semester,
      'course': instance.course,
      'user': instance.user,
    };

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Semester _$SemesterFromJson(Map<String, dynamic> json) => Semester(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$SemesterToJson(Semester instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      type: json['type'] as String,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'avatar': instance.avatar,
    };
