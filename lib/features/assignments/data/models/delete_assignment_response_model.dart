import 'package:json_annotation/json_annotation.dart';
part 'delete_assignment_response_model.g.dart';
@JsonSerializable()
class DeleteAssignmentResponseModel {

  final int code;
  final String message;

  DeleteAssignmentResponseModel({required this.code, required this.message});

  factory DeleteAssignmentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteAssignmentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteAssignmentResponseModelToJson(this);
}