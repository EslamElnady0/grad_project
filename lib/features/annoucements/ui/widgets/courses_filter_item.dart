import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

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

class SkeletonCourseItem extends StatelessWidget {
  const SkeletonCourseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      enabled: true,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        width: 80,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: Constants.whiteGrad,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: const Text("dasd"),
      ),
    );
  }
}
