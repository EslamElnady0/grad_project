import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/features/chat/data/models/chat_groups_response.dart';
import 'package:grad_project/features/chat/logic/chat_cubit/chat_cubit.dart';
import 'package:grad_project/features/chat/ui/views/chat_view.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/helpers/spacing.dart';
import 'chat_levels_item.dart';

class ChatLevelsListView extends StatelessWidget {
  const ChatLevelsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatGroupsCubit, ChatState>(
      builder: (context, state) => state.maybeWhen(
        orElse: () => _buildChatGroupsLoading(),
        chatSuccess: (data) {
          data as ChatGroupResponse;
          return ListView.separated(
            itemCount: data.allDepartChats.length,
            itemBuilder: (context, index) {
              bool isMyChat =
                  data.chatId.id == data.allDepartChats[index].id.toString();

              return ChatLevelsItem(
                onTap: () {
                  data.chatId.id == data.allDepartChats[index].id.toString()
                      ? GoRouter.of(context).push(ChatView.routeName)
                      : null;
                },
                title: data.allDepartChats[index].name,
                isMyChat: isMyChat,
              );
            },
            separatorBuilder: (context, index) => vGap(12),
          );
        },
      ),
    );
  }
}

Widget _buildChatGroupsLoading() {
  return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) => Skeletonizer(
            enabled: true,
            child: Skeleton.leaf(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: ChatLevelsItem(
                  onTap: () => GoRouter.of(context).push(ChatView.routeName),
                  title: "dasdasdasd",
                  isMyChat: false,
                ),
              ),
            ),
          ));
}
