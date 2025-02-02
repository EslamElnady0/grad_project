import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/constants.dart';

class CustomRedGradContainer extends StatelessWidget {
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
  const CustomRedGradContainer({
    super.key,
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
    this.raduis,
    this.transformAlignment,
    this.child,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: padding,
      decoration: decoration ??
          BoxDecoration(
            color: color,
            gradient: Constants.secondaryGrad,
            borderRadius: borderRadius ?? BorderRadius.circular(raduis ?? 16.r),
          ),
      foregroundDecoration: foregroundDecoration,
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
