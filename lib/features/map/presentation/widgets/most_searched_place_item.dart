import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

import '../../../../core/theme/app_colors.dart';

class MostSearchedPlaceItem extends StatelessWidget {
  final String title;
  const MostSearchedPlaceItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.black),
      ),
      child: Text(
        title,
        style: AppTextStyles.font12BlackSemiBold,
      ),
    );
  }
}
