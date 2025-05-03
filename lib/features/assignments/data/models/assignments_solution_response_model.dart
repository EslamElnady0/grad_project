
import 'package:json_annotation/json_annotation.dart';
part 'assignments_solution_response_model.g.dart';
@JsonSerializable()
class AssignmentsSolutionResponseModel {
 final int code;
 final String message;

  AssignmentsSolutionResponseModel({required this.code, required this.message});

  factory AssignmentsSolutionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AssignmentsSolutionResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$AssignmentsSolutionResponseModelToJson(this);
}
