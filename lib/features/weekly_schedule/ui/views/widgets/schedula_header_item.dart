

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class SchedulaHeaderItem extends StatelessWidget {
  const SchedulaHeaderItem({
    super.key, this.isFirst=false, required this.label,
  });
final bool isFirst ;
final String label ;
  @override
  Widget build(BuildContext context) {
    return Container(
    width: isFirst? 90.w :120.w,
    padding: EdgeInsets.symmetric(vertical: 5.h),
    margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
     borderRadius: BorderRadius.circular(8.r),
    gradient: LinearGradient(
      colors: [AppColors.redlight, AppColors.redDark], 
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
          
            ),
            child: Center(child: Text(label,style: AppTextStyles.font14WhiteSemiBold,)),
            );
  }
}

     