// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_groups_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatGroupResponse _$ChatGroupResponseFromJson(Map<String, dynamic> json) =>
    ChatGroupResponse(
      message: json['message'] as String,
      data: ChatGroupData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatGroupResponseToJson(ChatGroupResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

ChatGroupData _$ChatGroupDataFromJson(Map<String, dynamic> json) =>
    ChatGroupData(
      name: json['name'] as String,
    );

Map<String, dynamic> _$ChatGroupDataToJson(ChatGroupData instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
