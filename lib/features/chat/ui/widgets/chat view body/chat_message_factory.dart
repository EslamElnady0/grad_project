import 'package:flutter/material.dart';
import '../../../data/models/get_messages_response.dart';
import 'chat_message_widget.dart';
import 'chat_image_message_widget.dart';
import 'chat_text_with_images_widget.dart';
import 'chat_text_with_files_widget.dart';
import 'chat_video_widget.dart';

/// Factory widget that determines which message widget to use based on message type
class ChatMessageFactory extends StatelessWidget {
  final Message message;
  final String userId;

  const ChatMessageFactory({
    super.key,
    required this.message,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final attachments = message.attachments ?? [];

    // Check if message has attachments
    final hasAttachments = attachments.isNotEmpty;

    if (hasAttachments) {
      // Get unique attachment types
      final attachmentTypes = attachments.map((a) => a.type).toSet();

      // Text with images
      if (attachmentTypes.contains(AttachmentType.image) &&
          !attachmentTypes.contains(AttachmentType.video) &&
          !attachmentTypes.contains(AttachmentType.file) &&
          !attachmentTypes.contains(AttachmentType.voice)) {
        return ChatTextWithImagesWidget(
          message: message,
          userId: userId,
        );
      }

      // Text with files
      if (attachmentTypes.contains(AttachmentType.file) &&
          !attachmentTypes.contains(AttachmentType.image) &&
          !attachmentTypes.contains(AttachmentType.video) &&
          !attachmentTypes.contains(AttachmentType.voice)) {
        return ChatTextWithFilesWidget(
          message: message,
          userId: userId,
        );
      }

      // Text with videos
      if (attachmentTypes.contains(AttachmentType.video) &&
          !attachmentTypes.contains(AttachmentType.image) &&
          !attachmentTypes.contains(AttachmentType.file) &&
          !attachmentTypes.contains(AttachmentType.voice)) {
        return ChatVideoWidget(
          message: message,
          userId: userId,
        );
      }

      // Mixed attachments - fallback to text widget
      return ChatMessageWidget(
        message: message,
        userId: userId,
      );
    }

    // No attachments - check message type
    switch (message.type) {
      case MessageType.text:
        return ChatMessageWidget(
          message: message,
          userId: userId,
        );
      case MessageType.mediaOnly:
        // Check if message has image attachments
        final hasImageAttachments = attachments.any((attachment) {
          return attachment.type == AttachmentType.image;
        });

        if (hasImageAttachments) {
          return ChatImageMessageWidget(
            message: message,
            userId: userId,
          );
        }
        // Fallback to text widget if no image attachments
        return ChatMessageWidget(
          message: message,
          userId: userId,
        );
      case MessageType.voice:
        // TODO: Implement pure voice message widget
        return ChatMessageWidget(
          message: message,
          userId: userId,
        );
    }
  }
}
