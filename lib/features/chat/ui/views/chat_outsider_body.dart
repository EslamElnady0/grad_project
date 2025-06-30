import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/features/chat/logic/chat_cubit/chat_cubit.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/home_screens_header_row.dart';
import '../../../home/ui/widgets/title_text_widget.dart';
import '../widgets/outsider chat view/chat_levels_container.dart';

class ChatOutsiderBody extends StatefulWidget {
  const ChatOutsiderBody({super.key});

  @override
  State<ChatOutsiderBody> createState() => _ChatOutsiderBodyState();
}

class _ChatOutsiderBodyState extends State<ChatOutsiderBody> {
  @override
  void initState() {
    context.read<ChatGroupsCubit>().getChatGroups();
    super.initState();

    // Call unSeenMessages after the widget is built to ensure StreamBuilder is listening
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatGroupsCubit>().unSeenMessages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 22.h,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: HomeScreensHeaderRow(
              onMenuTap: () {
                Scaffold.of(context).openDrawer();
              },
              onSearchTap: () {},
            ),
          ),
          vGap(12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: TitleTextWidget(
              text: S.of(context).youCanJoinToChat,
            ),
          ),
          vGap(20),
          const Expanded(child: ChatLevelsContainer()),
        ],
      ),
    );
  }
}
