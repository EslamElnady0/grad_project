import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_questions_response_model.g.dart';
part 'get_all_questions_response_model.freezed.dart';

@freezed
class GetAllQuestionsResponseModel with _$GetAllQuestionsResponseModel {
  const factory GetAllQuestionsResponseModel({
 String? message,
    List<QuestionModel>? questions,
   int? totalQuestions,
  }) = _GetAllQuestionsResponseModel;

  factory GetAllQuestionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllQuestionsResponseModelFromJson(json);
}

@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
   // ignore: invalid_annotation_target
   @JsonKey(name: '_id') String? id,
    String? body,
    int? answers,
    int? likes,
    int? views,
    String? imageUrl,
     UserModel? user,
    String?  createdAt,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? name, 
    int? id,
    String? avatar,
    int? semester,
     DepartmentModel? department,
    bool? liked,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class DepartmentModel with _$DepartmentModel {
  const factory DepartmentModel({
    int? id,
    String? name,
  }) = _DepartmentModel;

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      _$DepartmentModelFromJson(json);
}