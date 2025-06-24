import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

import '../../../data/models/get_messages_response.dart';
import 'user_avatar_and_name.dart';

class ChatMessageWidget extends StatelessWidget {
  final Message message;
  final String userId;

  const ChatMessageWidget({
    super.key,
    required this.message,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final parts = message.sender.name.trim().split(RegExp(r'\s+'));
    final firstName = parts.isNotEmpty ? parts[0] : '';
    final secondInitial =
        parts.length > 1 && parts[1].isNotEmpty ? '${parts[1][0]}.' : '';
    final displayName = '$firstName $secondInitial';
    final isMe = message.sender.id.toString() == userId;
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserAvatarAndName(flag: isMe, sender: displayName),
        Container(
          constraints: BoxConstraints(maxWidth: 0.6.sw),
          margin: EdgeInsets.only(top: 4.h, right: 8.w, left: 8.w),
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: isMe ? AppColors.gray : Colors.black87,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            message.content ?? " ",
            style:
                AppTextStyles.font10GraySemiBold.copyWith(color: Colors.white),
          ),
        ),
        UserAvatarAndName(flag: !isMe, sender: displayName),
      ],
    );
  }
}
