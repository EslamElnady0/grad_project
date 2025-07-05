import 'package:json_annotation/json_annotation.dart';

part 'get_table_response_model.g.dart';

@JsonSerializable()
class GetTableResponseModel {
  final int code;
  final List<TableResponse> data;

  GetTableResponseModel({
    required this.code,
    required this.data,
  });

  factory GetTableResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetTableResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetTableResponseModelToJson(this);
}

@JsonSerializable()
class TableResponse {
  final String department;

  @JsonKey(name: 'department_id')
  final int departmentId;

  final int semester;

  final Map<String, List<SessionResponse>> sessions;

  TableResponse({
    required this.department,
    required this.departmentId,
    required this.semester,
    required this.sessions,
  });

  factory TableResponse.fromJson(Map<String, dynamic> json) =>
      _$TableResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TableResponseToJson(this);
}

@JsonSerializable()
class SessionResponse {
  final int id;
  final String type;
  final String course;
  final HallResponse hall;
  final String attendance;
  final String day;
  final String from;
  final String to;
  final String status;
  final Map<String, dynamic>? postponed;

  SessionResponse({
    required this.id,
    required this.type,
    required this.course,
    required this.hall,
    required this.attendance,
    required this.day,
    required this.from,
    required this.to,
    required this.status,
    this.postponed,
  });

  factory SessionResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SessionResponseToJson(this);
}

@JsonSerializable()
class HallResponse {
  @JsonKey(name: 'hall_id')
  final int hallId;

  @JsonKey(name: 'hall_name')
  final String hallName;

  @JsonKey(name: 'hall_code')
  final String hallCode;

  final String building;
  final String latitude;
  final String longitude;

  HallResponse({
    required this.hallId,
    required this.hallName,
    required this.hallCode,
    required this.building,
    required this.latitude,
    required this.longitude,
  });

  factory HallResponse.fromJson(Map<String, dynamic> json) =>
      _$HallResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HallResponseToJson(this);
}
