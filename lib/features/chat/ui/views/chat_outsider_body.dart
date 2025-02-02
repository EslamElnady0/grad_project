import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/home_screens_header_row.dart';
import '../../../home/ui/widgets/title_text_widget.dart';
import '../widgets/chat_levels_container.dart';

class ChatOutsiderBody extends StatelessWidget {
  const ChatOutsiderBody({super.key});

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
          Expanded(child: ChatLevelsContainer()),
        ],
      ),
    );
  }
}
