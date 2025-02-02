import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

import '../../../../core/theme/app_colors.dart';

class CoursesFilterItem extends StatefulWidget {
  final String title;
  const CoursesFilterItem({super.key, required this.title});

  @override
  State<CoursesFilterItem> createState() => _CoursesFilterItemState();
}

class _CoursesFilterItemState extends State<CoursesFilterItem> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: isPressed ? null : Constants.whiteGrad,
          color: isPressed ? AppColors.veryLightCyan : AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          widget.title,
          style: AppTextStyles.font12grayMedium.copyWith(
            color: isPressed ? AppColors.primaryColordark : AppColors.gray,
          ),
        ),
      ),
    );
  }
}
