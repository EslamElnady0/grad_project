import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';

import 'chat_levels_list_view.dart';

class ChatLevelsContainer extends StatelessWidget {
  const ChatLevelsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 18.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: Color(0xff112316).withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 16,
              offset: const Offset(0, 1),
            ),
          ]),
      child: Column(
        children: [
          Text(
            S.of(context).goLearnCommunicate,
            style: AppTextStyles.font16GrayMedium,
            textAlign: TextAlign.center,
          ),
          vGap(10),
          Text(
            S.of(context).cooperateShareThoughts,
            style: AppTextStyles.font12grayMedium,
            textAlign: TextAlign.center,
          ),
          vGap(20),
          Expanded(child: ChatLevelsListView()),
        ],
      ),
    );
  }
}
