import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class CustomTextAndIconButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final bool primaryButton;
  final VoidCallback onTap;
  final TextStyle? style;

  const CustomTextAndIconButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon,
    this.style,
    required this.primaryButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: LinearGradient(
          colors: [AppColors.primaryColorlight, AppColors.primaryColordark],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 14,
            color: AppColors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon.icon, color: AppColors.white, size: 14.sp),
            hGap(5),
            Text(text, style: style ?? AppTextStyles.font12WhiteMedium),
          ],
        ),
      ),
    );
  }
}
