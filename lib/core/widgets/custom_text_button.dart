import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/inner_shadow.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final double? width;
  final VoidCallback onTap;
  final Widget? child;
  final TextStyle? style;
  const CustomTextButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.style,
      this.child, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 14,
              color: AppColors.black.withOpacity(0.25)),
        ],
      ),
      child: InnerShadow(
        shadows: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 13,
            color: AppColors.black.withOpacity(0.25),
          )
        ],
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width:  width ?? double.infinity,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.primaryColordark,
            ),
            alignment: Alignment.center,
            child: Center(
              child: Text(text, style: AppTextStyles.font20WhiteSemiBold),
            ),
          ),
        ),
      ),
    );
  }
}
