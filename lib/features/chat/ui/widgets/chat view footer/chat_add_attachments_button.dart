import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/theme/app_colors.dart';

class ChatAddAttachmentsButton extends StatelessWidget {
  const ChatAddAttachmentsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
          color: AppColors.darkerBlue,
          borderRadius: BorderRadius.circular(12.r)),
      child: SvgPicture.asset(
        Assets.imagesSvgsAddIcon,
        height: 20.h,
      ),
    );
  }
}
