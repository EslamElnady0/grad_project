// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_quiz_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitQuizRequestBody _$SubmitQuizRequestBodyFromJson(
        Map<String, dynamic> json) =>
    SubmitQuizRequestBody(
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubmitQuizRequestBodyToJson(
        SubmitQuizRequestBody instance) =>
    <String, dynamic>{
      'questions': instance.questions.map((e) => e.toJson()).toList(),
    };

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      question: json['question'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers.map((e) => e.toJson()).toList(),
    };

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) => AnswerModel(
      answer: json['answer'] as String,
      correct: (json['correct'] as num).toInt(),
    );

Map<String, dynamic> _$AnswerModelToJson(AnswerModel instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'correct': instance.correct,
    };
