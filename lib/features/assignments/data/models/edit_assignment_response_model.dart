import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_assignment_response_model.g.dart';
@JsonSerializable()
class EditAssignmentResponseModel {
  final dynamic code;
  final String message;

  EditAssignmentResponseModel({required this.code, required this.message});

  factory EditAssignmentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EditAssignmentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditAssignmentResponseModelToJson(this);
}
