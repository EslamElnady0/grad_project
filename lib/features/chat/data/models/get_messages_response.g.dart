// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_messages_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMessagesResponse _$GetMessagesResponseFromJson(Map<String, dynamic> json) =>
    GetMessagesResponse(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetMessagesResponseToJson(
        GetMessagesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as String,
      senderId: (json['senderId'] as num).toInt(),
      content: json['content'] as String,
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'content': instance.content,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      deliveredTo: (json['deliveredTo'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      seenBy: (json['seenBy'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'deliveredTo': instance.deliveredTo,
      'seenBy': instance.seenBy,
    };
