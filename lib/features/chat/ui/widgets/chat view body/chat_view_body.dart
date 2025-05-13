import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/shared_pref_helper.dart';
import 'package:grad_project/features/chat/logic/get_latest_messages_cubit/get_latest_messages_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../data/models/get_messages_response.dart';
import 'chat_message_widget.dart';
import '../../../../../core/widgets/text entry footer/text_entry_footer.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  String userId = '';
  @override
  void initState() {
    getUserId();
    context.read<GetLatestMessagesCubit>().getLatestMessages();
    super.initState();
  }

  Future<void> getUserId() async {
    userId = await SharedPrefHelper.getString(Constants.userId) ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<GetLatestMessagesCubit, GetLatestMessagesState>(
              builder: (context, state) => state.maybeWhen(
                    orElse: () => _buildLoadingMessages(),
                    getLatestMessagesSuccess: (data) {
                      data as GetMessagesResponse;
                      return ListView.separated(
                        reverse: true,
                        itemCount: data.data.length,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        itemBuilder: (context, index) {
                          final msg = data.data[index];
                          return ChatMessageWidget(
                            sender: msg.senderId.toString(),
                            message: msg.content,
                            isMe: msg.senderId.toString() == userId,
                          );
                        },
                        separatorBuilder: (context, index) => vGap(12),
                      );
                    },
                  )),
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

Widget _buildLoadingMessages() {
  return Skeletonizer(
    enabled: true,
    child: ListView.separated(
      reverse: true,
      itemCount: 10,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      itemBuilder: (context, index) {
        final msg = Constants.dummyMessages[index];
        return ChatMessageWidget(
          sender: msg["sender"],
          message: msg["message"],
          isMe: msg["isMe"],
        );
      },
      separatorBuilder: (context, index) => vGap(12),
    ),
  );
}
