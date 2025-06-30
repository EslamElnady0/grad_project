// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_questions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetAllQuestionsResponseModelImpl _$$GetAllQuestionsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GetAllQuestionsResponseModelImpl(
      message: json['message'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalQuestions: (json['totalQuestions'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$GetAllQuestionsResponseModelImplToJson(
        _$GetAllQuestionsResponseModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'questions': instance.questions,
      'totalQuestions': instance.totalQuestions,
    };

_$QuestionModelImpl _$$QuestionModelImplFromJson(Map<String, dynamic> json) =>
    _$QuestionModelImpl(
      id: json['_id'] as String?,
      body: json['body'] as String?,
      answers: (json['answers'] as num?)?.toInt(),
      likes: (json['likes'] as num?)?.toInt(),
      views: (json['views'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$QuestionModelImplToJson(_$QuestionModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'body': instance.body,
      'answers': instance.answers,
      'likes': instance.likes,
      'views': instance.views,
      'imageUrl': instance.imageUrl,
      'user': instance.user,
      'createdAt': instance.createdAt,
    };

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      name: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      semester: (json['semester'] as num?)?.toInt(),
      department: json['department'] as String?,
      liked: json['liked'] as bool?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'avatar': instance.avatar,
      'semester': instance.semester,
      'department': instance.department,
      'liked': instance.liked,
    };
