import 'package:json_annotation/json_annotation.dart';
part 'students_response.g.dart';

@JsonSerializable()
class StudentsResponse {
  final int code;
  final List<Student> data;

  StudentsResponse({
    required this.code,
    required this.data,
  });

  factory StudentsResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentsResponseToJson(this);
}

@JsonSerializable()
class Student {
  final int id;
  final String name;
  @JsonKey(name: 'uni_code')
  final String uniCode;
  final String email;
  final String nationality;
  @JsonKey(name: 'personal_id')
  final String personalId;
  final int group;

  Student({
    required this.id,
    required this.name,
    required this.uniCode,
    required this.email,
    required this.nationality,
    required this.personalId,
    required this.group,
  });

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
