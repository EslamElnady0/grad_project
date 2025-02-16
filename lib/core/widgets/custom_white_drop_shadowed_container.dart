import 'package:flutter/widgets.dart';

import '../theme/app_colors.dart';

class CustomWhiteDropShadowedContainer extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  const CustomWhiteDropShadowedContainer({super.key, this.padding, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding ?? EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0.32),
                  blurRadius: 5.15,
                  spreadRadius: 0.32,
                  color: AppColors.black.withOpacity(0.15))
            ]),
        child: child);
  }
}
