import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/theme/app_colors.dart';

class ChatSendButton extends StatelessWidget {
  const ChatSendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
            color: AppColors.primaryColordark,
            borderRadius: BorderRadius.circular(12.r)),
        child: SvgPicture.asset(
          Assets.imagesSvgsSendIcon,
          height: 20.h,
        ),
      ),
    );
  }
}
