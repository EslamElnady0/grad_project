import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import '../../../../core/lifecycle/app_lifecycle_cubit.dart';
import '../../data/models/chat_groups_response.dart';
import '../../logic/inner_chat_cubit/inner_chat_cubit.dart';
import '../widgets/chat app bar/chat_view_app_bar.dart';
import '../widgets/chat view body/chat_view_body.dart';

class ChatView extends StatelessWidget {
  static const String routeName = '/chatView';
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final chatGroupData =
        GoRouterState.of(context).extra as DepartmentChatGroup;
    return BlocListener<AppLifecycleCubit, AppLifecycleState>(
      listener: (context, state) {
        if (state != AppLifecycleState.resumed) {
          context.read<InnerChatCubit>().closeChat();
        } else {
          context.read<InnerChatCubit>().openChat();
        }
      },
      child: RepaintBoundary(
        child: CustomScaffold(
          body: Column(
            children: [
              ChatViewAppBar(chatGroupData: chatGroupData),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: const Divider(),
              ),
              const Expanded(child: ChatViewBody()),
            ],
          ),
        ),
      ),
    );
  }
}
