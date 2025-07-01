class SendMessageModel {
  final String? text;
  final List<Attachment>? attachments;

  SendMessageModel({required this.text, required this.attachments})
      : assert(text != null || attachments != null,
            'Either text or attachments must be provided');
  Map<String, dynamic> toJson() {
    return {
      if (text != null) 'text': text,
      if (attachments != null || attachments!.isNotEmpty)
        'attachments':
            attachments?.map((attachment) => attachment.toJson()).toList(),
    };
  }
}

class Attachment {
  final String base64;
  final String name;
  final String? type;

  Attachment({required this.base64, required this.name, this.type});
  Map<String, dynamic> toJson() {
    return {
      'base64': base64,
      'name': name,
      'type': type,
    };
  }
}
