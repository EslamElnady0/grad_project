import 'package:json_annotation/json_annotation.dart';

part 'add_question_request_model.g.dart';

@JsonSerializable()
class AddQuestionRequestModel {
  final String body;
  final String image;

  AddQuestionRequestModel({
    required this.body,
    required this.image,
  });

  factory AddQuestionRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddQuestionRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddQuestionRequestModelToJson(this);
}
