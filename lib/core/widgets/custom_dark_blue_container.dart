import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class CustomDarkBlueContainer extends StatelessWidget {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final double? raduis;
  final AlignmentGeometry? transformAlignment;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final Clip clipBehavior = Clip.none;

  const CustomDarkBlueContainer(
      {super.key,
      this.alignment,
      this.padding,
      this.color,
      this.decoration,
      this.foregroundDecoration,
      this.width,
      this.height,
      this.constraints,
      this.margin,
      this.transform,
      this.transformAlignment,
      this.child,
      this.raduis,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration ??
          BoxDecoration(
            color: AppColors.darkblue,
            borderRadius: borderRadius ?? BorderRadius.circular(raduis ?? 16.r),
          ),
      foregroundDecoration: foregroundDecoration ??
          BoxDecoration(
            color: AppColors.black.withOpacity(0.2),
            borderRadius: borderRadius ?? BorderRadius.circular(raduis ?? 16.r),
          ),
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      child: child,
    );
  }
}
