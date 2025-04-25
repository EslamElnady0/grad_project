import 'package:json_annotation/json_annotation.dart';

part 'add_annoucement_request_body.g.dart';

@JsonSerializable(includeIfNull: false)
class AnnouncementRequestBody {
  @JsonKey(name: 'department_id')
  final String departmentId;

  @JsonKey(name: 'semester_id')
  final String semesterId;

  @JsonKey(name: 'course_id')
  final String courseId;

  final String title;
  final String body;

  @JsonKey(includeIfNull: false)
  final String? date;

  @JsonKey(includeIfNull: false)
  final String? time;

  AnnouncementRequestBody({
    required this.departmentId,
    required this.semesterId,
    required this.courseId,
    required this.title,
    required this.body,
    this.date,
    this.time,
  });

  factory AnnouncementRequestBody.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementRequestBodyToJson(this);
}
