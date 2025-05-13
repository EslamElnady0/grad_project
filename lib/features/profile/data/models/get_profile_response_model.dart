import 'package:json_annotation/json_annotation.dart';
part 'get_profile_response_model.g.dart';

@JsonSerializable()
class ProfileModel {
  String name;
  String email;
  @JsonKey(name: "avatar")
  String? avatarUrl;
  @JsonKey(name: "uni_code")
  String code;
  Department department;
  String type;

  ProfileModel({
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.code,
    required this.department,
    required this.type,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

@JsonSerializable()
class Department {
  String name;
  int id;

  Department({
    required this.name,
    required this.id,
  });

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}

@JsonSerializable()
class StudentModel extends ProfileModel {
  String nationality;
  @JsonKey(name: "personal_id")
  String nationalId;
  @JsonKey(name: "group")
  int section;
  @JsonKey(name: "semester")
  Level level;
  StudentModel({
    required super.name,
    required super.email,
    required super.avatarUrl,
    required super.code,
    required super.department,
    required super.type,
    required this.nationality,
    required this.nationalId,
    required this.section,
    required this.level,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentModelToJson(this);
}

@JsonSerializable()
class Level {
  String name;
  int id;

  Level({
    required this.name,
    required this.id,
  });

  factory Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);
  Map<String, dynamic> toJson() => _$LevelToJson(this);
}

@JsonSerializable()
class TeacherModel extends ProfileModel {
  String? description;

  TeacherModel({
    required super.name,
    required super.email,
    required super.avatarUrl,
    required super.code,
    required super.department,
    required super.type,
    this.description,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherModelToJson(this);
}

@JsonSerializable()
class StudentProfileResponseModel {
  int code;
  StudentModel data;

  StudentProfileResponseModel({
    required this.code,
    required this.data,
  });

  factory StudentProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StudentProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentProfileResponseModelToJson(this);
}

@JsonSerializable()
class TeacherProfileResponseModel {
  int code;
  TeacherModel data;

  TeacherProfileResponseModel({
    required this.code,
    required this.data,
  });

  factory TeacherProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherProfileResponseModelToJson(this);
}
