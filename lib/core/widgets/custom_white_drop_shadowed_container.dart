import 'package:flutter/widgets.dart';

import '../theme/app_colors.dart';

class CustomWhiteDropShadowedContainer extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final Widget? child;
  final double? width;
  const CustomWhiteDropShadowedContainer(
      {super.key, this.padding, this.child, this.width, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        width: width ?? double.infinity,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 0.32),
                  blurRadius: 5.15,
                  spreadRadius: 0.32,
                  color: AppColors.black.withOpacity(0.15))
            ]),
        child: child);
  }
}
