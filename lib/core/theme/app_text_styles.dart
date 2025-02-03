import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/font_weight_helper.dart';

import 'app_colors.dart';

class ChangaTextStyle extends TextStyle {
  const ChangaTextStyle({
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.color,
    super.letterSpacing,
    super.height,
    super.decoration,
  }) : super(
          fontFamily: 'Changa',
        );
}

class AppTextStyles {
  const AppTextStyles._();

  //naming ==> fontSizeColorWeight
  static TextStyle font14BlackRegular = ChangaTextStyle(
    fontSize: 14.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font10greenRegular = ChangaTextStyle(
    fontSize: 10.sp,
    color: AppColors.primaryColordark,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font24BlackSemiBold = ChangaTextStyle(
    fontSize: 28.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font12BlackMedium = ChangaTextStyle(
    fontSize: 12.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font12BlackSemiBold = ChangaTextStyle(
    fontSize: 12.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font10grayRegular = ChangaTextStyle(
    fontSize: 10.sp,
    color: AppColors.gray,
    fontWeight: FontWeightHelper.regular,
  );
    static TextStyle font24BlackBold = ChangaTextStyle(
    fontSize: 24.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.bold,
  );
      static TextStyle font16BlackMedium = ChangaTextStyle(
    fontSize: 16.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.medium,
  );
    static TextStyle font12GrayMedium = ChangaTextStyle(
    fontSize: 12.sp,
    color: AppColors.gray,
    fontWeight: FontWeightHelper.medium,
  );
        static TextStyle font16GrayBold = ChangaTextStyle(
    fontSize: 16.sp,
    color: AppColors.gray,
    fontWeight: FontWeightHelper.bold,
  );
}
