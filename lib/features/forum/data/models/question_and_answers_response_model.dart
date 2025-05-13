import 'package:json_annotation/json_annotation.dart';
import 'package:grad_project/features/forum/data/models/get_all_questions_response_model.dart';

part 'question_and_answers_response_model.g.dart';

@JsonSerializable()
class QuestionAndAnswersResponseModel {
  final String? message;
  final QuestionAndAnswerDataModel? data;

  @JsonKey(name: 'totalAnswers')
  final int? totalAnswers;

  QuestionAndAnswersResponseModel({
    this.message,
     this.data,
    this.totalAnswers,
  });

  factory QuestionAndAnswersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionAndAnswersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionAndAnswersResponseModelToJson(this);
}

@JsonSerializable()
class QuestionAndAnswerDataModel {
  final QuestionModel? question;
  final List<AnswerModel>? answers;
  final String? createdAt;
  QuestionAndAnswerDataModel({
    this.question,
    this.answers,
    this.createdAt,
  });

  factory QuestionAndAnswerDataModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionAndAnswerDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionAndAnswerDataModelToJson(this);
}

@JsonSerializable()
class AnswerModel {
  @JsonKey(name: '_id')
  final String? id;

  final String? body;
  final int? likes;
  final UserModel? user;
  final String? createdAt;

  AnswerModel({
    this.id,
    this.body,
    this.likes,
    this.user,
    this.createdAt,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}
