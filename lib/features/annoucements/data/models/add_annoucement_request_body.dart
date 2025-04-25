import 'package:json_annotation/json_annotation.dart';

part 'add_annoucement_request_body.g.dart';

@JsonSerializable(includeIfNull: false)
class AddAnnouncementRequestBody {
  @JsonKey(name: 'department_id')
  final int departmentId;

  @JsonKey(name: 'semester_id')
  final int semesterId;

  @JsonKey(name: 'course_id')
  final int courseId;

  final String title;
  final String body;

  @JsonKey(includeIfNull: false)
  final String? date;

  @JsonKey(includeIfNull: false)
  final String? time;

  AddAnnouncementRequestBody({
    required this.departmentId,
    required this.semesterId,
    required this.courseId,
    required this.title,
    required this.body,
    this.date,
    this.time,
  });

  factory AddAnnouncementRequestBody.fromJson(Map<String, dynamic> json) =>
      _$AddAnnouncementRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AddAnnouncementRequestBodyToJson(this);
}
