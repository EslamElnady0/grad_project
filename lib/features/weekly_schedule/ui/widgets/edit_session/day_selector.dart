import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';

class DaySelector extends StatelessWidget {
  final String selectedDay;
  final List<String> days;
  final String Function(String, BuildContext) getDayDisplayName;
  final ValueChanged<String?> onChanged;

  const DaySelector({
    super.key,
    required this.selectedDay,
    required this.days,
    required this.getDayDisplayName,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).select_day,
          style: AppTextStyles.font14BlackMedium,
        ),
        SizedBox(height: 6.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gray),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedDay,
              items: days.map((day) {
                return DropdownMenuItem<String>(
                  value: day,
                  child: Text(
                    getDayDisplayName(day, context),
                    style: AppTextStyles.font14BlackMedium,
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
