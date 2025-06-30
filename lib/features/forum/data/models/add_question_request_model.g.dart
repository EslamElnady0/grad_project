// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_question_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddQuestionRequestModel _$AddQuestionRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddQuestionRequestModel(
      body: json['body'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$AddQuestionRequestModelToJson(
        AddQuestionRequestModel instance) =>
    <String, dynamic>{
      'body': instance.body,
      'image': instance.image,
    };
