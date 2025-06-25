// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_quiz_answers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentQuizAnswersResponse _$StudentQuizAnswersResponseFromJson(
        Map<String, dynamic> json) =>
    StudentQuizAnswersResponse(
      code: (json['code'] as num).toInt(),
      data:
          StudentQuizAnswersData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentQuizAnswersResponseToJson(
        StudentQuizAnswersResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

StudentQuizAnswersData _$StudentQuizAnswersDataFromJson(
        Map<String, dynamic> json) =>
    StudentQuizAnswersData(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      maxDegree: (json['max_degree'] as num).toInt(),
      studentDegree: (json['student_degree'] as num).toInt(),
      date: json['date'] as String,
      startTime: json['start_time'] as String,
      duration: (json['duration'] as num).toInt(),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => StudentQuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentQuizAnswersDataToJson(
        StudentQuizAnswersData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'max_degree': instance.maxDegree,
      'student_degree': instance.studentDegree,
      'date': instance.date,
      'start_time': instance.startTime,
      'duration': instance.duration,
      'questions': instance.questions,
    };

StudentQuizQuestion _$StudentQuizQuestionFromJson(Map<String, dynamic> json) =>
    StudentQuizQuestion(
      id: (json['id'] as num).toInt(),
      question: json['question'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => StudentQuizAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
      studentAnswer: (json['student_answer'] as num).toInt(),
    );

Map<String, dynamic> _$StudentQuizQuestionToJson(
        StudentQuizQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answers': instance.answers,
      'student_answer': instance.studentAnswer,
    };

StudentQuizAnswer _$StudentQuizAnswerFromJson(Map<String, dynamic> json) =>
    StudentQuizAnswer(
      id: (json['id'] as num).toInt(),
      answer: json['answer'] as String,
      correct: (json['correct'] as num).toInt(),
    );

Map<String, dynamic> _$StudentQuizAnswerToJson(StudentQuizAnswer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
      'correct': instance.correct,
    };
