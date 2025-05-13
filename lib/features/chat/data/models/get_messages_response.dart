import 'package:json_annotation/json_annotation.dart';

part 'get_messages_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetMessagesResponse {
  final String message;
  final List<Message> data;

  GetMessagesResponse({
    required this.message,
    required this.data,
  });

  factory GetMessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMessagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMessagesResponseToJson(this);
}

@JsonSerializable()
class Message {
  final String id;
  final int senderId;
  final String content;
  final Status status;
  final DateTime createdAt;

  Message({
    required this.id,
    required this.senderId,
    required this.content,
    required this.status,
    required this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

@JsonSerializable()
class Status {
  final List<int> deliveredTo;
  final List<int> seenBy;

  Status({
    required this.deliveredTo,
    required this.seenBy,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
