import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/font_weight_helper.dart';
import 'package:grad_project/core/theme/app_colors.dart';

import '../../../../../core/helpers/app_assets.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ChatLevelsItem extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final int index;
  const ChatLevelsItem(
      {super.key, required this.title, this.onTap, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
              color:
                  index == 3 ? AppColors.veryLightCyan : AppColors.backGround,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                  color:
                      index == 3 ? AppColors.primaryColordark : AppColors.gray,
                  width: 2),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22.r,
                  backgroundImage: const AssetImage(Assets.imagesAvatarDoc),
                ),
                hGap(15),
                Text(
                  title,
                  style: AppTextStyles.font20DarkerBlueBold.copyWith(
                      fontWeight: index == 3
                          ? FontWeightHelper.bold
                          : FontWeightHelper.semiBold,
                      color: index == 3
                          ? AppColors.primaryColordark
                          : AppColors.darkerBlue),
                ),
              ],
            ),
          ),
        ));
  }
}
