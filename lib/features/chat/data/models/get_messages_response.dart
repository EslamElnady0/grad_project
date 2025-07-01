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
  final Sender sender;
  final String? content;
  Status status;
  final String? messageType;
  final List<MessageAttachement>? attachments;
  final DateTime createdAt;

  Message({
    required this.id,
    required this.sender,
    required this.content,
    required this.status,
    required this.createdAt,
    required this.messageType,
    this.attachments,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  MessageType get type {
    switch (messageType) {
      case 'text':
        return MessageType.text;
      case 'voice':
        return MessageType.voice;
      case 'mediaOnly':
        return MessageType.mediaOnly;
      default:
        return MessageType.text;
    }
  }
}

@JsonSerializable()
class Sender {
  final int id;
  final String name;
  final String avatar;

  Sender({
    required this.id,
    required this.name,
    required this.avatar,
  });

  factory Sender.fromJson(Map<String, dynamic> json) => _$SenderFromJson(json);

  Map<String, dynamic> toJson() => _$SenderToJson(this);
}

@JsonSerializable()
class Status {
  final List<Sender> deliveredTo;
  final List<Sender> seenBy;

  Status({
    required this.deliveredTo,
    required this.seenBy,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MessageAttachement {
  final String fileUrl;
  final String fileType;
  final String? name;

  MessageAttachement(
      {required this.fileUrl, required this.fileType, this.name});
  factory MessageAttachement.fromJson(Map<String, dynamic> json) =>
      _$MessageAttachementFromJson(json);
  Map<String, dynamic> toJson() => _$MessageAttachementToJson(this);
  AttachmentType get type {
    switch (fileType) {
      case 'image':
        return AttachmentType.image;
      case 'video':
        return AttachmentType.video;
      case 'file':
        return AttachmentType.file;
      case 'voice':
        return AttachmentType.voice;
      default:
        return AttachmentType.file; // Default to file if unknown
    }
  }
}

enum MessageType {
  text,
  voice,
  mediaOnly,
}

enum AttachmentType {
  image,
  video,
  file,
  voice,
}
