// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_quiz_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizRequestModel _$QuizRequestModelFromJson(Map<String, dynamic> json) =>
    QuizRequestModel(
      courseId: json['course_id'] as String,
      questionDegree: json['question_degree'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      totalDegree: json['total_degree'] as String,
      date: json['date'] as String,
      startTime: json['start_time'] as String,
      duration: json['duration'] as String,
      newQuestions: (json['new_questions'] as List<dynamic>)
          .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizRequestModelToJson(QuizRequestModel instance) =>
    <String, dynamic>{
      'course_id': instance.courseId,
      'title': instance.title,
      'description': instance.description,
      'total_degree': instance.totalDegree,
      'question_degree': instance.questionDegree,
      'date': instance.date,
      'start_time': instance.startTime,
      'duration': instance.duration,
      'new_questions': instance.newQuestions.map((e) => e.toJson()).toList(),
    };

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      question: json['question'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers.map((e) => e.toJson()).toList(),
    };

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) => AnswerModel(
      answer: json['answer'] as String,
      isCorrect: (json['is_correct'] as num).toInt(),
    );

Map<String, dynamic> _$AnswerModelToJson(AnswerModel instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'is_correct': instance.isCorrect,
    };
