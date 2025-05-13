import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/chat/logic/get_latest_messages_cubit/get_latest_messages_cubit.dart';
import 'package:grad_project/features/chat/logic/inner_chat_cubit/inner_chat_cubit.dart';

import '../widgets/chat app bar/chat_view_app_bar.dart';
import '../widgets/chat view body/chat_view_body.dart';

class ChatView extends StatelessWidget {
  static const String routeName = '/chatView';
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const ChatViewAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
            ),
            child: const Divider(),
          ),
          Expanded(
              child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<InnerChatCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<GetLatestMessagesCubit>(),
              ),
            ],
            child: const ChatViewBody(),
          )),
        ],
      ),
    );
  }
}
