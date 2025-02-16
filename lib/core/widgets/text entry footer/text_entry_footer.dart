import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/widgets/add_attachments_button.dart';
import 'package:grad_project/core/widgets/text%20entry%20footer/chat_send_button.dart';

import 'chat_text_field.dart';

class ChatViewFooter extends StatelessWidget {
  const ChatViewFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff112316).withOpacity(0.15),
          spreadRadius: 1,
          blurRadius: 16,
          offset: const Offset(0, 1),
        ),
      ]),
      child: Row(
        children: [
          const ChatAddAttachmentsButton(),
          hGap(8),
          const Expanded(child: ChatTextField()),
          hGap(8),
          const ChatSendButton()
        ],
      ),
    );
  }
}
