import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/shared_pref_helper.dart';
import 'package:grad_project/features/chat/logic/get_latest_messages_cubit/get_latest_messages_cubit.dart';
import 'package:grad_project/features/chat/logic/inner_chat_cubit/inner_chat_cubit.dart';
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
  Future<void> initSocket() async {
    await context.read<InnerChatCubit>().init(onConnected: () {
      if (mounted) {
        context.read<InnerChatCubit>().registerUser(context);
      }
    });
  }

  @override
  void initState() {
    getUserId();
    initSocket();
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
          child: StreamBuilder<List<Message>>(
            stream: context.read<GetLatestMessagesCubit>().messagesStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return _buildLoadingMessages();

              final messages = snapshot.data!;
              return ListView.separated(
                reverse: true,
                itemCount: messages.length,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  return ChatMessageWidget(
                    sender: msg.senderId.toString(),
                    message: msg.content,
                    isMe: msg.senderId.toString() == userId,
                  );
                },
                separatorBuilder: (_, __) => vGap(12),
              );
            },
          ),
        ),
        ChatViewFooter(
          onSend: (text) {
            context.read<InnerChatCubit>().sendMessage(text, context);
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
