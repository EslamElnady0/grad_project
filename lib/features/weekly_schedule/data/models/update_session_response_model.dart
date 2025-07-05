import 'package:json_annotation/json_annotation.dart';

part 'update_session_response_model.g.dart';

@JsonSerializable()
class UpdateSessionResponseModel {
  final String message;
  @JsonKey(name: 'original_session')
  final OriginalSessionModel originalSession;
  @JsonKey(name: 'postponed_session')
  final PostponedSessionModel postponedSession;

  UpdateSessionResponseModel({
    required this.message,
    required this.originalSession,
    required this.postponedSession,
  });

  factory UpdateSessionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateSessionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateSessionResponseModelToJson(this);
}

@JsonSerializable()
class OriginalSessionModel {
  final int id;
  final String type;
  @JsonKey(name: 'course_id')
  final int courseId;
  @JsonKey(name: 'department_id')
  final int departmentId;
  @JsonKey(name: 'semester_id')
  final int semesterId;
  @JsonKey(name: 'hall_id')
  final int hallId;
  final String attendance;
  final String day;
  final String from;
  final String to;
  final String status;
  final int week;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final String? date;

  OriginalSessionModel({
    required this.id,
    required this.type,
    required this.courseId,
    required this.departmentId,
    required this.semesterId,
    required this.hallId,
    required this.attendance,
    required this.day,
    required this.from,
    required this.to,
    required this.status,
    required this.week,
    this.createdAt,
    required this.updatedAt,
    this.date,
  });

  factory OriginalSessionModel.fromJson(Map<String, dynamic> json) =>
      _$OriginalSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$OriginalSessionModelToJson(this);
}

@JsonSerializable()
class PostponedSessionModel {
  final int id;
  @JsonKey(name: 'session_id')
  final int sessionId;
  final String date;
  final String day;
  final String from;
  final String to;
  @JsonKey(name: 'hall_id')
  final int hallId;
  final String attendance;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  PostponedSessionModel({
    required this.id,
    required this.sessionId,
    required this.date,
    required this.day,
    required this.from,
    required this.to,
    required this.hallId,
    required this.attendance,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PostponedSessionModel.fromJson(Map<String, dynamic> json) =>
      _$PostponedSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostponedSessionModelToJson(this);
}
