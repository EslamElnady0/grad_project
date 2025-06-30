import 'package:json_annotation/json_annotation.dart';

part 'add_question_response_model.g.dart';

@JsonSerializable()
class AddQuestionResponseModel {
  final int code;
  final String message;
  final dynamic data;

  AddQuestionResponseModel({
    required this.code,
    required this.message,
    this.data,
  });

  factory AddQuestionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddQuestionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddQuestionResponseModelToJson(this);
}
