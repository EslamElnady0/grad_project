import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:intl/intl.dart';
import '../../../data/models/get_messages_response.dart';
import 'user_avatar_and_name.dart';

class ChatVideoWidget extends StatelessWidget {
  final Message message;
  final String userId;

  const ChatVideoWidget({
    super.key,
    required this.message,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final isMe = message.sender.id.toString() == userId;
    final timeString = DateFormat('h:mm a').format(message.createdAt);
    final attachments = message.attachments ?? [];

    final videoAttachments = attachments.where((attachment) {
      return attachment.type == AttachmentType.video;
    }).toList();

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
              if (message.content != null && message.content!.isNotEmpty) ...[
                Text(
                  message.content!,
                  style: AppTextStyles.font10GraySemiBold
                      .copyWith(color: Colors.white, fontSize: 11.sp),
                ),
                const SizedBox(height: 8),
              ],
              _buildVideoAttachments(videoAttachments),
              const SizedBox(height: 4),
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

  Widget _buildVideoAttachments(List<MessageAttachement> attachments) {
    if (attachments.isEmpty) return const SizedBox.shrink();

    return Column(
      children: attachments.map((attachment) {
        return Container(
          margin: EdgeInsets.only(bottom: 8.h),
          child: _buildVideoThumbnail(attachment),
        );
      }).toList(),
    );
  }

  Widget _buildVideoThumbnail(MessageAttachement attachment) {
    return Container(
      width: 200.w,
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.black,
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.grey[800],
            ),
            child: Center(
              child: Icon(
                Icons.video_file,
                color: Colors.white,
                size: 40.r,
              ),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 24.r,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8.h,
            right: 8.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                attachment.name ?? 'Video',
                style: AppTextStyles.font10GraySemiBold
                    .copyWith(color: Colors.white, fontSize: 8.sp),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // TODO: Implement video player
                },
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageStatus(Status status, {double iconSize = 12}) {
    final deliveredTo = status.deliveredTo.map((e) => e.id.toString()).toSet();
    final seenBy = status.seenBy.map((e) => e.id.toString()).toSet();
    deliveredTo.remove(userId);
    seenBy.remove(userId);
    if (seenBy.isNotEmpty) {
      return Icon(Icons.done_all, color: Colors.blue, size: iconSize);
    } else if (deliveredTo.isNotEmpty) {
      return Icon(Icons.done_all, color: Colors.white, size: iconSize);
    } else {
      return Icon(Icons.check, color: Colors.white, size: iconSize);
    }
  }
}
