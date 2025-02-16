import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';

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
          const Expanded(child: ChatViewBody()),
        ],
      ),
    );
  }
}
