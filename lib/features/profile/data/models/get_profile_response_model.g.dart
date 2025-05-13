// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      name: json['name'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatar'] as String?,
      code: json['uni_code'] as String,
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      type: json['type'] as String,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatarUrl,
      'uni_code': instance.code,
      'department': instance.department,
      'type': instance.type,
    };

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      name: json['name'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };

StudentModel _$StudentModelFromJson(Map<String, dynamic> json) => StudentModel(
      name: json['name'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatar'] as String?,
      code: json['uni_code'] as String,
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      type: json['type'] as String,
      nationality: json['nationality'] as String,
      nationalId: json['personal_id'] as String,
      section: (json['group'] as num).toInt(),
      level: Level.fromJson(json['semester'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentModelToJson(StudentModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatarUrl,
      'uni_code': instance.code,
      'department': instance.department,
      'type': instance.type,
      'nationality': instance.nationality,
      'personal_id': instance.nationalId,
      'group': instance.section,
      'semester': instance.level,
    };

Level _$LevelFromJson(Map<String, dynamic> json) => Level(
      name: json['name'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$LevelToJson(Level instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };

TeacherModel _$TeacherModelFromJson(Map<String, dynamic> json) => TeacherModel(
      name: json['name'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatar'] as String?,
      code: json['uni_code'] as String,
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      type: json['type'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TeacherModelToJson(TeacherModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatarUrl,
      'uni_code': instance.code,
      'department': instance.department,
      'type': instance.type,
      'description': instance.description,
    };

StudentProfileResponseModel _$StudentProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    StudentProfileResponseModel(
      code: (json['code'] as num).toInt(),
      data: StudentModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentProfileResponseModelToJson(
        StudentProfileResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

TeacherProfileResponseModel _$TeacherProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    TeacherProfileResponseModel(
      code: (json['code'] as num).toInt(),
      data: TeacherModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeacherProfileResponseModelToJson(
        TeacherProfileResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };
