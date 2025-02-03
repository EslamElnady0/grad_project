import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/chat/ui/widgets/chat%20view%20body/user_avatar_and_name.dart';

class ChatMessageWidget extends StatelessWidget {
  final String message;
  final String sender;
  final bool isMe;

  const ChatMessageWidget({
    super.key,
    required this.message,
    required this.sender,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserAvatarAndName(flag: isMe, sender: sender),
        Container(
          constraints: BoxConstraints(maxWidth: 0.6.sw),
          margin: EdgeInsets.only(top: 4.h, right: 8.w, left: 8.w),
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: isMe ? AppColors.gray : Colors.black87,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            message,
            style:
                AppTextStyles.font10GraySemiBold.copyWith(color: Colors.white),
          ),
        ),
        UserAvatarAndName(flag: !isMe, sender: sender),
      ],
    );
  }
}
