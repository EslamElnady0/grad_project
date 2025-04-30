import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox vGap(double height) => SizedBox(
      height: height.h,
    );

SizedBox hGap(double width) => SizedBox(
      width: width.w,
    );

Widget symmetricPaddingWidget(
        {required Widget child,
        double? horizontalPadding,
        double? verticalPadding}) =>
    Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 16.w,
          vertical: verticalPadding ?? 0.h),
      child: child,
    );
