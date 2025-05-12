import 'package:json_annotation/json_annotation.dart';

part 'chat_groups_response.g.dart';

@JsonSerializable()
class ChatGroupResponse {
  final String message;
  final ChatGroupData data;

  ChatGroupResponse({required this.message, required this.data});

  factory ChatGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatGroupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatGroupResponseToJson(this);
}

@JsonSerializable()
class ChatGroupData {
  final String name;

  ChatGroupData({required this.name});

  factory ChatGroupData.fromJson(Map<String, dynamic> json) =>
      _$ChatGroupDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChatGroupDataToJson(this);
}
