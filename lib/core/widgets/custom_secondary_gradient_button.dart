import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/inner_shadow.dart';

import '../helpers/constants.dart';

class CustomSecondaryGradientButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double? radius;
  const CustomSecondaryGradientButton(
      {super.key, required this.onTap, required this.title, this.radius});

  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      shadows: [
        BoxShadow(
            offset: Offset(-1, -1),
            blurRadius: 12.3,
            color: AppColors.black.withOpacity(0.25))
      ],
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            gradient: Constants.secondaryGrad,
            borderRadius: BorderRadius.circular(radius ?? 16),
          ),
          child: Text(
            title,
            style: AppTextStyles.font14WhiteBold,
          ),
        ),
      ),
    );
  }
}
