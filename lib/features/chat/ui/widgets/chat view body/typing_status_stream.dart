import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/events/typing%20events/user_typing_event.dart';
import 'package:grad_project/features/chat/logic/inner_chat_cubit/inner_chat_cubit.dart';

import '../typing_indicator_widget.dart';

class TypingStatusStream extends StatelessWidget {
  final String userId;
  const TypingStatusStream({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: StreamBuilder<List<UserTypingEvent>>(
        stream: context.read<InnerChatCubit>().sendersStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox.shrink();
          final data = snapshot.data!;
          // Filter out the current user
          final filtered =
              data.where((e) => e.user.id.toString() != userId).toList();
          if (filtered.isEmpty) {
            return const SizedBox.shrink();
          }
          // Show up to the first 3 senders
          final toShow = filtered.take(3).toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: toShow
                .map(
                  (e) => Padding(
                    padding: EdgeInsetsDirectional.only(end: 16.w, top: 10.h),
                    child: TypingIndicatorWidget(
                      isVisible: true,
                      userName: e.user.name,
                      type: e.type,
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
