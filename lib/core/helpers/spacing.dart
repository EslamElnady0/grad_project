import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox vGap(double height) => SizedBox(
      height: height.h,
    );

SizedBox hGap(double width) => SizedBox(
      width: width.w,
    );

Widget padding16Widget({required Widget child}) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: child,
    );
