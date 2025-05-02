// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_quiz_using_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQuizByIdResponse _$GetQuizByIdResponseFromJson(Map<String, dynamic> json) =>
    GetQuizByIdResponse(
      code: (json['code'] as num).toInt(),
      data: QuizModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetQuizByIdResponseToJson(
        GetQuizByIdResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data.toJson(),
    };

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) => QuizModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      totalDegree: (json['total_degree'] as num).toInt(),
      date: json['date'] as String,
      startTime: json['start_time'] as String,
      duration: (json['duration'] as num).toInt(),
      status: json['status'] as String,
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
      teacher: json['teacher'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizModelToJson(QuizModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'total_degree': instance.totalDegree,
      'date': instance.date,
      'start_time': instance.startTime,
      'duration': instance.duration,
      'status': instance.status,
      'course': instance.course.toJson(),
      'teacher': instance.teacher,
      'questions': instance.questions.map((e) => e.toJson()).toList(),
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: (json['id'] as num).toInt(),
      question: json['question'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answers': instance.answers.map((e) => e.toJson()).toList(),
    };

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      id: (json['id'] as num).toInt(),
      answer: json['answer'] as String,
      correct: (json['correct'] as num).toInt(),
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
      'correct': instance.correct,
    };
