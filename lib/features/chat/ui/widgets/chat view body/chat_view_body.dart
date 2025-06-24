import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/shared_pref_helper.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/widgets/text%20entry%20footer/text_entry_footer.dart';
import 'package:grad_project/features/chat/logic/get_latest_messages_cubit/get_latest_messages_cubit.dart';
import 'package:grad_project/features/chat/logic/inner_chat_cubit/inner_chat_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../data/models/get_messages_response.dart';
import '../../cubit/file_picker_cubit.dart';
import 'chat_message_widget.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  String userId = '';
  bool _isFetchingOlder = false;

  @override
  void initState() {
    super.initState();
    getUserId();
    context.read<GetLatestMessagesCubit>().getLatestMessages();
    context.read<InnerChatCubit>().scrollController.addListener(_onScroll);
  }

  Future<void> getUserId() async {
    userId = await SharedPrefHelper.getString(Constants.userId) ?? '';
  }

  void _onScroll() {
    if (context.read<InnerChatCubit>().scrollController.position.pixels >=
        context
                .read<InnerChatCubit>()
                .scrollController
                .position
                .maxScrollExtent -
            300) {
      if (!_isFetchingOlder) {
        _isFetchingOlder = true;
        context
            .read<GetLatestMessagesCubit>()
            .getOlder30Messages()
            .whenComplete(() {
          _isFetchingOlder = false;
        });
      }
    }
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
                controller: context.read<InnerChatCubit>().scrollController,
                reverse: true,
                itemCount: messages.length + 1,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                itemBuilder: (context, index) {
                  if (index == messages.length) {
                    return _buildPaginationLoader();
                  }

                  return ChatMessageWidget(
                    message: messages[index],
                    userId: userId,
                  );
                },
                separatorBuilder: (_, __) => vGap(12),
              );
            },
          ),
        ),
        BlocProvider(
          create: (context) => FilePickerCubit(),
          child: TextEntryFooter(
            onSend: (text, files) {
              context.read<InnerChatCubit>().sendMessage(text, context);
            },
            onTextChanged: (text) {},
          ),
        ),
      ],
    );
  }

  Widget _buildPaginationLoader() {
    return BlocBuilder<GetLatestMessagesCubit, GetLatestMessagesState>(
      builder: (context, state) => state.maybeWhen(
        orElse: () => const SizedBox.shrink(),
        getLatestMessagesLoading: () => const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CircularProgressIndicator(
                color: AppColors.darkblue, strokeWidth: 2),
          ),
        ),
      ),
    );
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
            message: msg,
            userId: userId,
          );
        },
        separatorBuilder: (context, index) => vGap(12),
      ),
    );
  }
}
