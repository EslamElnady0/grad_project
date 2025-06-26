// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_groups_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatGroupResponse _$ChatGroupResponseFromJson(Map<String, dynamic> json) =>
    ChatGroupResponse(
      message: json['message'] as String,
      chatId: ChatId.fromJson(json['chatId'] as Map<String, dynamic>),
      allDepartChats: (json['allDepartChats'] as List<dynamic>)
          .map((e) => DepartmentChatGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatGroupResponseToJson(ChatGroupResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'chatId': instance.chatId,
      'allDepartChats': instance.allDepartChats,
    };

ChatId _$ChatIdFromJson(Map<String, dynamic> json) => ChatId(
      id: json['id'] as String,
    );

Map<String, dynamic> _$ChatIdToJson(ChatId instance) => <String, dynamic>{
      'id': instance.id,
    };

DepartmentChatGroup _$DepartmentChatGroupFromJson(Map<String, dynamic> json) =>
    DepartmentChatGroup(
      id: json['id'] as String,
      name: json['name'] as String,
      imageurl: json['imageurl'] as String?,
    );

Map<String, dynamic> _$DepartmentChatGroupToJson(
        DepartmentChatGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageurl': instance.imageurl,
    };
