import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class DisplayAndDropDownButton extends StatelessWidget {
  final String title;
  final String value;
  const DisplayAndDropDownButton(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.font14BlackBold
                .copyWith(color: AppColors.darkerBlue),
          ),
          vGap(12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white, // Adjust the background color as needed
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(blurRadius: 16, color: Colors.grey.withOpacity(0.2))
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  value,
                  style: AppTextStyles.font13BlackBold
                      .copyWith(color: AppColors.darkGray),
                ),
                const Spacer(),
                SvgPicture.asset(Assets.imagesSvgsIosArrowIcon)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
