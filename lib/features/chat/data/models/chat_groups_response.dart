import 'package:json_annotation/json_annotation.dart';

part 'chat_groups_response.g.dart';

@JsonSerializable()
class ChatGroupResponse {
  final String message;
  final ChatId chatId;
  final List<DepartmentChatGroup> allDepartChats;

  ChatGroupResponse({
    required this.message,
    required this.chatId,
    required this.allDepartChats,
  });

  factory ChatGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatGroupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatGroupResponseToJson(this);
}

@JsonSerializable()
class ChatId {
  final String id;

  ChatId({required this.id});

  factory ChatId.fromJson(Map<String, dynamic> json) => _$ChatIdFromJson(json);

  Map<String, dynamic> toJson() => _$ChatIdToJson(this);
}

@JsonSerializable()
class DepartmentChatGroup {
  final String id;
  final String name;
  final String? imageurl;

  DepartmentChatGroup({
    required this.id,
    required this.name,
    required this.imageurl,
  });

  factory DepartmentChatGroup.fromJson(Map<String, dynamic> json) =>
      _$DepartmentChatGroupFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentChatGroupToJson(this);
}
