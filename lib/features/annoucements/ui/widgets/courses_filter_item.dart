import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

import '../../../../core/helpers/constants.dart';

class CoursesFilterItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CoursesFilterItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: isSelected ? null : Constants.whiteGrad,
          color: isSelected ? AppColors.veryLightCyan : AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          title,
          style: AppTextStyles.font12grayMedium.copyWith(
            color: isSelected ? AppColors.primaryColordark : AppColors.gray,
          ),
        ),
      ),
    );
  }
}
