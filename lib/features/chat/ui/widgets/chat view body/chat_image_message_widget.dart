import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:intl/intl.dart';
import '../../../data/models/get_messages_response.dart';
import 'user_avatar_and_name.dart';

class ChatImageMessageWidget extends StatelessWidget {
  final Message message;
  final String userId;

  const ChatImageMessageWidget({
    super.key,
    required this.message,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final isMe = message.sender.id.toString() == userId;
    final timeString = DateFormat('h:mm a').format(message.createdAt);
    final attachments = message.attachments ?? [];

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        UserAvatarAndName(flag: isMe, sender: message.sender),
        Container(
          constraints: BoxConstraints(maxWidth: 0.6.sw),
          margin: EdgeInsets.only(top: 4.h, right: 8.w, left: 8.w),
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: isMe ? AppColors.gray : Colors.black87,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image grid
              _buildImageGrid(attachments, context),
              const SizedBox(height: 4),
              // Status and time row
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isMe) ...[
                    _buildMessageStatus(message.status, iconSize: 14),
                    SizedBox(width: 2.w),
                  ],
                  Text(
                    timeString,
                    style: AppTextStyles.font10GraySemiBold
                        .copyWith(color: Colors.white70, fontSize: 8.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
        UserAvatarAndName(flag: !isMe, sender: message.sender),
      ],
    );
  }

  Widget _buildImageGrid(
      List<MessageAttachement> attachments, BuildContext context) {
    if (attachments.isEmpty) {
      return const SizedBox.shrink();
    }

    // Filter only image attachments
    final imageAttachments = attachments.where((attachment) {
      final fileType = attachment.fileType.toLowerCase();
      return fileType.contains('image') ||
          fileType.contains('jpg') ||
          fileType.contains('jpeg') ||
          fileType.contains('png') ||
          fileType.contains('gif') ||
          fileType.contains('webp');
    }).toList();

    if (imageAttachments.isEmpty) {
      return const SizedBox.shrink();
    }

    // Single image
    if (imageAttachments.length == 1) {
      return _buildSingleImage(imageAttachments[0], context);
    }

    // Multiple images - create grid
    return _buildMultipleImagesGrid(imageAttachments, context);
  }

  Widget _buildSingleImage(
      MessageAttachement attachment, BuildContext context) {
    return GestureDetector(
      onTap: () => _openFullScreenImage(context, attachment.fileUrl),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.network(
          attachment.fileUrl,
          width: 200.w,
          height: 200.h,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: 200.w,
              height: 200.h,
              color: Colors.grey[300],
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 200.w,
              height: 200.h,
              color: Colors.grey[300],
              child: const Icon(Icons.error, color: Colors.red),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMultipleImagesGrid(
      List<MessageAttachement> attachments, BuildContext context) {
    final int imageCount = attachments.length;

    if (imageCount == 2) {
      return Row(
        children: [
          Expanded(
            child: _buildGridImage(attachments[0], 100.h, context),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: _buildGridImage(attachments[1], 100.h, context),
          ),
        ],
      );
    }

    if (imageCount == 3) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildGridImage(attachments[0], 100.h, context),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: _buildGridImage(attachments[1], 100.h, context),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          _buildGridImage(attachments[2], 100.h, context),
        ],
      );
    }

    if (imageCount == 4) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildGridImage(attachments[0], 100.h, context),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: _buildGridImage(attachments[1], 100.h, context),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Expanded(
                child: _buildGridImage(attachments[2], 100.h, context),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: _buildGridImage(attachments[3], 100.h, context),
              ),
            ],
          ),
        ],
      );
    }

    // For more than 4 images, show first 4 with overlay
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildGridImage(attachments[0], 100.h, context),
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: _buildGridImage(attachments[1], 100.h, context),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  _buildGridImage(attachments[2], 100.h, context),
                  if (imageCount > 4)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Text(
                            '+${imageCount - 3}',
                            style: AppTextStyles.font12WhiteSemiBold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: _buildGridImage(attachments[3], 100.h, context),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGridImage(
      MessageAttachement attachment, double height, BuildContext context) {
    return GestureDetector(
      onTap: () => _openFullScreenImage(context, attachment.fileUrl),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.network(
          attachment.fileUrl,
          height: height,
          width: double.infinity,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              height: height,
              color: Colors.grey[300],
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: height,
              color: Colors.grey[300],
              child: const Icon(Icons.error, color: Colors.red),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMessageStatus(Status status, {double iconSize = 12}) {
    // Remove self from seenBy and deliveredTo
    final deliveredTo = status.deliveredTo.map((e) => e.id.toString()).toSet();
    final seenBy = status.seenBy.map((e) => e.id.toString()).toSet();
    deliveredTo.remove(userId);
    seenBy.remove(userId);
    // If any user (other than self) has seen the message, show blue
    if (seenBy.isNotEmpty) {
      return Icon(Icons.done_all, color: Colors.blue, size: iconSize);
    } else if (deliveredTo.isNotEmpty) {
      return Icon(Icons.done_all, color: Colors.white, size: iconSize);
    } else {
      return Icon(Icons.check, color: Colors.white, size: iconSize);
    }
  }

  void _openFullScreenImage(BuildContext context, String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FullScreenImageView(imageUrl: imageUrl),
      ),
    );
  }
}

class FullScreenImageView extends StatelessWidget {
  final String imageUrl;
  const FullScreenImageView({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.network(imageUrl),
        ),
      ),
    );
  }
}
