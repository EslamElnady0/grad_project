import 'package:json_annotation/json_annotation.dart';

part 'add_annoucement_response_body.g.dart';

@JsonSerializable()
class AddAnnouncementResponseBody {
  final int code;
  final String message;
  final AnnouncementData data;

  AddAnnouncementResponseBody({
    required this.code,
    required this.message,
    required this.data,
  });

  factory AddAnnouncementResponseBody.fromJson(Map<String, dynamic> json) =>
      _$AddAnnouncementResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AddAnnouncementResponseBodyToJson(this);
}

@JsonSerializable()
class AnnouncementData {
  final int id;
  final String title;
  final String body;
  final String date;
  final String time;
  final String from;
  final Department department;
  final Semester semester;
  final Course course;
  final User user;

  AnnouncementData({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
    required this.time,
    required this.from,
    required this.department,
    required this.semester,
    required this.course,
    required this.user,
  });

  factory AnnouncementData.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementDataFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementDataToJson(this);
}

@JsonSerializable()
class Department {
  final int id;
  final String name;

  Department({
    required this.id,
    required this.name,
  });

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}

@JsonSerializable()
class Semester {
  final int id;
  final String name;

  Semester({
    required this.id,
    required this.name,
  });

  factory Semester.fromJson(Map<String, dynamic> json) =>
      _$SemesterFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterToJson(this);
}

@JsonSerializable()
class Course {
  final int id;
  final String name;

  Course({
    required this.id,
    required this.name,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

@JsonSerializable()
class User {
  final int id;
  final String name;
  final String type;
  final String? avatar;

  User({
    required this.id,
    required this.name,
    required this.type,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
