import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/constants.dart';

import '../../../../../core/helpers/spacing.dart';
import 'chat_message_widget.dart';
import '../../../../../core/widgets/text entry footer/text_entry_footer.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            reverse: true,
            itemCount: Constants.dummyMessages.length,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            itemBuilder: (context, index) {
              final msg = Constants.dummyMessages[index];
              return ChatMessageWidget(
                sender: msg['sender'],
                message: msg['message'],
                isMe: msg['isMe'],
              );
            },
            separatorBuilder: (context, index) => vGap(12),
          ),
        ),
      ChatViewFooter(
  onSend: (text) {
    print('Send this message: $text');
  },
  onTextChanged: (text) {
    print('Typing: $text');
  },
  onAttach: () {
    print('Open attachments dialog');
  },
),
      ],
    );
  }
}
