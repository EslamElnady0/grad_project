import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class CustomTextAndIconButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final bool primaryButton;
  final VoidCallback onTap;
  final TextStyle? style;
  final double? width;
  final Color? color;
  const CustomTextAndIconButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon,
    this.style,
    this.color,
    required this.primaryButton,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r),
        gradient: color == null
            ? (primaryButton
                ? const LinearGradient(
                    colors: [
                      AppColors.primaryColorlight,
                      AppColors.primaryColordark
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : const LinearGradient(
                    colors: [AppColors.redlight, AppColors.redDark],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ))
            : null,
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
            icon,
            hGap(5),
            Text(text, style: style ?? AppTextStyles.font12WhiteMedium),
          ],
        ),
      ),
    );
  }
}
