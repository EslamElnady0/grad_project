import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/font_weight_helper.dart';

import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  //naming ==> fontSizeColorWeight
  static TextStyle font14BlackRegular = TextStyle(
    fontSize: 14.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font24BlackSemiBold = TextStyle(
    fontSize: 28.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.semiBold,
  );
}
