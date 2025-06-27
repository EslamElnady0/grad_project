import 'package:json_annotation/json_annotation.dart';
part 'assign_grade_response_model.g.dart';

@JsonSerializable()
class AssignGradeResponseModel {
  final int code;
  final String message;

  AssignGradeResponseModel({
    required this.code,
    required this.message,
  });

  factory AssignGradeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AssignGradeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssignGradeResponseModelToJson(this);
}
