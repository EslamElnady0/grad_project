import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class CustomToggleButton extends StatefulWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const CustomToggleButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: widget.isSelected ? Constants.whiteGrad : null,
          color: widget.isSelected ? AppColors.veryLightCyan : null,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color:
                widget.isSelected ? AppColors.primaryColordark : AppColors.gray,
          ),
        ),
        child: Text(
          widget.title,
          style: AppTextStyles.font14GrayMedium.copyWith(
            color:
                widget.isSelected ? AppColors.primaryColordark : AppColors.gray,
          ),
        ),
      ),
    );
  }
}

class CustomSkeletonContainer extends StatelessWidget {
  const CustomSkeletonContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: Constants.whiteGrad,
          color: AppColors.veryLightCyan,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColors.primaryColordark,
          ),
        ),
        child: Text(
          "dasdasd",
          style: AppTextStyles.font14GrayMedium.copyWith(
            color: AppColors.primaryColordark,
          ),
        ),
      ),
    );
  }
}
