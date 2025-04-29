import 'package:json_annotation/json_annotation.dart';

part 'update_annoucement_response_body.g.dart';

@JsonSerializable()
class UpdateAnnoucementResponseBody {
  final int code;
  final String message;
  final UpdateData? data;

  UpdateAnnoucementResponseBody({
    required this.code,
    required this.message,
    this.data,
  });

  factory UpdateAnnoucementResponseBody.fromJson(Map<String, dynamic> json) =>
      _$UpdateAnnoucementResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateAnnoucementResponseBodyToJson(this);
}

@JsonSerializable()
class UpdateData {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'department_id')
  final int departmentId;
  @JsonKey(name: 'semester_id')
  final int semesterId;
  @JsonKey(name: 'course_id')
  final int courseId;
  final String title;
  final String body;
  @JsonKey(name: 'post_in')
  final DateTime postIn;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @JsonKey(name: 'course_details_id')
  final String courseDetailsId;

  UpdateData({
    required this.id,
    required this.userId,
    required this.departmentId,
    required this.semesterId,
    required this.courseId,
    required this.title,
    required this.body,
    required this.postIn,
    required this.createdAt,
    required this.updatedAt,
    required this.courseDetailsId,
  });

  factory UpdateData.fromJson(Map<String, dynamic> json) =>
      _$UpdateDataFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateDataToJson(this);
}
