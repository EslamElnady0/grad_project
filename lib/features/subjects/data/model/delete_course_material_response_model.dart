import 'package:json_annotation/json_annotation.dart';

part 'delete_course_material_response_model.g.dart';

@JsonSerializable()
class DeleteCourseMaterialResponseModel {
  final int code;
  final String message;

  DeleteCourseMaterialResponseModel({required this.code, required this.message});

  factory DeleteCourseMaterialResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteCourseMaterialResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteCourseMaterialResponseModelToJson(this);
}