import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CustomToggleTitleButton extends StatelessWidget {
  final String title;
  final bool isPressed;
  final VoidCallback? onTap;

  const CustomToggleTitleButton({
    super.key,
    required this.title,
    required this.isPressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: isPressed ? Constants.whiteGrad : null,
          color: isPressed ? AppColors.veryLightCyan : null,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isPressed ? AppColors.primaryColordark : AppColors.gray,
          ),
        ),
        child: Text(
          title,
          style: AppTextStyles.font14GrayMedium.copyWith(
            color: isPressed ? AppColors.primaryColordark : AppColors.gray,
          ),
        ),
      ),
    );
  }
}
