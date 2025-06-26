import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_hollow_button.dart';

class DateAndTimeSection extends StatelessWidget {
  final String selectedDate;
  final String selectedTime;
  final void Function(DateTime) onDateSelected;
  final void Function(TimeOfDay) onTimeSelected;

  const DateAndTimeSection({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.onDateSelected,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Date Button
        Expanded(
          child: CustomHollowButton(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            borderWidth: 1,
            borderColor: AppColors.black,
            onPressed: () {
              showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime.utc(2026),
              ).then((value) {
                if (value != null) {
                  onDateSelected(value);
                }
              });
            },
            child: Row(
              children: [
                Text(
                  selectedDate,
                  style: AppTextStyles.font12BlackSemiBold
                      .copyWith(color: AppColors.darkGray),
                ),
                const Spacer(),
                SvgPicture.asset(Assets.imagesSvgsIosArrowIcon),
              ],
            ),
          ),
        ),
        hGap(30),

        // Time Button
        CustomHollowButton(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          borderWidth: 1,
          borderColor: AppColors.black,
          onPressed: () {
            showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            ).then((value) {
              if (value != null) {
                onTimeSelected(value);
              }
            });
          },
          child: Row(
            children: [
              Text(
                selectedTime,
                style: AppTextStyles.font12BlackSemiBold
                    .copyWith(color: AppColors.darkGray),
              ),
              hGap(20),
              SvgPicture.asset(Assets.imagesSvgsIosArrowIcon),
            ],
          ),
        ),
      ],
    );
  }
}
