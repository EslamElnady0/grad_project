import 'package:json_annotation/json_annotation.dart';
part 'create_assignment_response_model.g.dart';

@JsonSerializable()
class CreateAssignmentResponseModel {
  final dynamic code;
  final String message;

  CreateAssignmentResponseModel({required this.code, required this.message});

  factory CreateAssignmentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateAssignmentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAssignmentResponseModelToJson(this);
}
