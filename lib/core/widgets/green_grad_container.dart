import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

class GreenGradButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final TextStyle? style;
  final double? radius;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  const GreenGradButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.padding,
      this.style,
      this.radius,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: Constants.primaryGrad,
        borderRadius: BorderRadius.circular(radius ?? 12),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 34.w, vertical: 10.h),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(title, style: style ?? AppTextStyles.font14WhiteBold),
      ),
    );
  }
}
