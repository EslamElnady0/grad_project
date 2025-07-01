// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_and_answers_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionAndAnswersResponseModel _$QuestionAndAnswersResponseModelFromJson(
        Map<String, dynamic> json) =>
    QuestionAndAnswersResponseModel(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : QuestionAndAnswerDataModel.fromJson(
              json['data'] as Map<String, dynamic>),
      totalAnswers: (json['totalAnswers'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QuestionAndAnswersResponseModelToJson(
        QuestionAndAnswersResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'totalAnswers': instance.totalAnswers,
    };

QuestionAndAnswerDataModel _$QuestionAndAnswerDataModelFromJson(
        Map<String, dynamic> json) =>
    QuestionAndAnswerDataModel(
      question: json['question'] == null
          ? null
          : QuestionModel.fromJson(json['question'] as Map<String, dynamic>),
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$QuestionAndAnswerDataModelToJson(
        QuestionAndAnswerDataModel instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
      'createdAt': instance.createdAt,
    };

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) => AnswerModel(
      id: json['_id'] as String?,
      body: json['body'] as String?,
      likes: (json['likes'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$AnswerModelToJson(AnswerModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'imageUrl': instance.imageUrl,
      'body': instance.body,
      'likes': instance.likes,
      'user': instance.user,
      'createdAt': instance.createdAt,
    };
