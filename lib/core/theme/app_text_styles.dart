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
  static TextStyle font14BlackBold = ChangaTextStyle(
    fontSize: 14.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font13BlackBold = ChangaTextStyle(
    fontSize: 13.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14WhiteBold = ChangaTextStyle(
    fontSize: 14.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14WhiteSemiBold = ChangaTextStyle(
    fontSize: 14.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font10greenMedium = ChangaTextStyle(
    fontSize: 10.sp,
    color: AppColors.primaryColordark,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font12grayMedium = ChangaTextStyle(
    fontSize: 12.sp,
    color: AppColors.gray,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font13BlackSemiBold = ChangaTextStyle(
    fontSize: 13.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font13WhiteBold = ChangaTextStyle(
    fontSize: 13.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font9GrayMedium = ChangaTextStyle(
    fontSize: 9.sp,
    color: AppColors.gray,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font9GraySemiBold = ChangaTextStyle(
    fontSize: 9.sp,
    color: AppColors.gray,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font8GraySemiBold = ChangaTextStyle(
    fontSize: 8.sp,
    color: AppColors.gray,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font8BlackSemiBold = ChangaTextStyle(
    fontSize: 8.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font10GraySemiBold = ChangaTextStyle(
    fontSize: 10.sp,
    color: AppColors.gray,
    fontWeight: FontWeightHelper.semiBold,
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
  static TextStyle font22GreenSemiBold = ChangaTextStyle(
    fontSize: 22.sp,
    color: AppColors.primaryColordark,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font10grayRegular = ChangaTextStyle(
    fontSize: 10.sp,
    color: AppColors.gray,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font10BlackMedium = ChangaTextStyle(
    fontSize: 10.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.medium,
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
  static TextStyle font16BlackSemiBold = ChangaTextStyle(
    fontSize: 16.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font16BlackBold = ChangaTextStyle(
    fontSize: 16.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font15BlackSemiBold = ChangaTextStyle(
    fontSize: 15.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.semiBold,
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
  static TextStyle font16GrayMedium = ChangaTextStyle(
    fontSize: 16.sp,
    color: AppColors.gray,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font16GreenSemiBold = ChangaTextStyle(
    fontSize: 16.sp,
    color: AppColors.primaryColordark,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font16DarkerBlueSemiBold = ChangaTextStyle(
    fontSize: 16.sp,
    color: AppColors.darkblue,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font20DarkerBlueBold = ChangaTextStyle(
    fontSize: 20.sp,
    color: AppColors.darkblue,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font16WhiteSemiBold = ChangaTextStyle(
    fontSize: 16.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font20WhiteSemiBold = ChangaTextStyle(
    fontSize: 20.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font12WhiteMedium = ChangaTextStyle(
    fontSize: 12.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font12WhiteSemiBold = ChangaTextStyle(
    fontSize: 12.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font10grayMedium = ChangaTextStyle(
    fontSize: 10.sp,
    color: AppColors.gray,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font11BlackSemiBold = ChangaTextStyle(
    fontSize: 11.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font14GrayMedium = ChangaTextStyle(
    fontSize: 14.sp,
    color: AppColors.gray,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font20WhiteBold = ChangaTextStyle(
    fontSize: 20.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font15BlackBold = ChangaTextStyle(
    fontSize: 15.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font8DarkBlueSemiBold = ChangaTextStyle(
    fontSize: 8.sp,
    color: AppColors.darkblue,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font13DarkBlueBold = ChangaTextStyle(
    fontSize: 13.sp,
    color: AppColors.darkblue,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font8WhiteSemiBold = ChangaTextStyle(
    fontSize: 8.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font10BlackSemiBold = ChangaTextStyle(
    fontSize: 10.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font16WhiteBold = ChangaTextStyle(
    fontSize: 16.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14BlackSemiBold = ChangaTextStyle(
    fontSize: 14.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.semiBold,
  );
}
