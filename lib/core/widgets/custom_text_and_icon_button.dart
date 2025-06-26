import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
    required this.primaryButton,
    this.style,
    this.color,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Skeleton.leaf(
        enabled: true,
        child: Container(
          width: width,
          constraints: BoxConstraints(
            minWidth: 65.w, // Add minimum width
            maxWidth: width ?? double.infinity, // Add maximum width
          ),
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 15.w,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12.r),
            gradient: _buildGradient(),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 14,
                color: AppColors.black.withOpacity(0.1),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              hGap(5),
              Flexible( // Add Flexible here
                child: Text(
                  text,
                  style: style ?? AppTextStyles.font12WhiteMedium,
                  overflow: TextOverflow.ellipsis, // Add overflow handling
                  maxLines: 1, // Limit to one line
                  textAlign: TextAlign.center, // Center align text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Extract gradient logic to a separate method
  LinearGradient? _buildGradient() {
    if (color != null) return null;
    
    return primaryButton
        ? const LinearGradient(
            colors: [
              AppColors.primaryColorlight,
              AppColors.primaryColordark
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        : const LinearGradient(
            colors: [
              AppColors.redlight,
              AppColors.redDark
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          );
  }
}