import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class CustomToggleButton extends StatefulWidget {
  final String title;

  const CustomToggleButton({
    super.key,
    required this.title,
  });

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: isPressed ? Constants.whiteGrad : null,
          color: isPressed ? AppColors.veryLightCyan : null,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isPressed ? AppColors.primaryColordark : AppColors.gray,
          ),
        ),
        child: Text(
          widget.title,
          style: AppTextStyles.font14GrayMedium.copyWith(
            color: isPressed ? AppColors.primaryColordark : AppColors.gray,
          ),
        ),
      ),
    );
  }
}
