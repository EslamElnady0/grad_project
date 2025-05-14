// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_quiz_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitQuizRequestBody _$SubmitQuizRequestBodyFromJson(
        Map<String, dynamic> json) =>
    SubmitQuizRequestBody(
      questions: (json['questions'] as List<dynamic>)
          .map(
              (e) => QuestionSubmitionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubmitQuizRequestBodyToJson(
        SubmitQuizRequestBody instance) =>
    <String, dynamic>{
      'questions': instance.questions.map((e) => e.toJson()).toList(),
    };

QuestionSubmitionModel _$QuestionSubmitionModelFromJson(
        Map<String, dynamic> json) =>
    QuestionSubmitionModel(
      questionId: json['question'] as String,
      answerId: json['answer'] as String,
    );

Map<String, dynamic> _$QuestionSubmitionModelToJson(
        QuestionSubmitionModel instance) =>
    <String, dynamic>{
      'question': instance.questionId,
      'answer': instance.answerId,
    };
