import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';

class DateField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;

  const DateField({
    super.key,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).select_date,
          style: AppTextStyles.font14BlackMedium,
        ),
        SizedBox(height: 6.h),
        TextFormField(
          controller: controller,
          style: AppTextStyles.font14BlackMedium,
          readOnly: true,
          onTap: onTap,
          decoration: InputDecoration(
            hintText: S.of(context).date_format_hint,
            hintStyle: AppTextStyles.font12GrayMedium,
            suffixIcon: const Icon(Icons.calendar_today, color: AppColors.gray),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.gray),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.gray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.primaryColordark),
            ),
          ),
        ),
      ],
    );
  }
}
