import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/format_date_and_time_helpers.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/widgets/custom_hollow_button.dart';
import 'package:grad_project/features/annoucements/logic/add_annoucements_cubit/add_annoucements_cubit.dart';
import 'package:intl/intl.dart';
import '../../../../core/helpers/app_assets.dart';
import '../../../../core/theme/app_text_styles.dart';

class DateAndTimeSection extends StatefulWidget {
  const DateAndTimeSection({super.key});

  @override
  State<DateAndTimeSection> createState() => _DateAndTimeSectionState();
}

class _DateAndTimeSectionState extends State<DateAndTimeSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomHollowButton(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              borderWidth: 1,
              borderColor: AppColors.black,
              onPressed: () {
                showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.utc(2026))
                    .then((value) {
                  if (value != null) {
                    setState(() {
                      context.read<AddAnnoucementsCubit>().selectedDate =
                          DateFormat('yyyy/MM/dd', 'en_US').format(value);
                    });
                  }
                });
              },
              child: Row(
                children: [
                  Text(
                      context.read<AddAnnoucementsCubit>().selectedDate ??
                          'اختر تاريخ',
                      style: AppTextStyles.font12BlackSemiBold
                          .copyWith(color: AppColors.darkGray)),
                  const Spacer(),
                  SvgPicture.asset(Assets.imagesSvgsIosArrowIcon)
                ],
              )),
        ),
        hGap(30),
        CustomHollowButton(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            borderWidth: 1,
            borderColor: AppColors.black,
            onPressed: () {
              showTimePicker(context: context, initialTime: TimeOfDay.now())
                  .then((value) {
                if (value != null) {
                  setState(() {
                    context.read<AddAnnoucementsCubit>().selectedTime =
                        '${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}';
                  });
                }
              });
            },
            child: Row(
              children: [
                Text(
                    context.read<AddAnnoucementsCubit>().selectedTime == null
                        ? 'اختر وقت'
                        : FormatDateAndTimeHelpers.convertTo12HourFormat(
                            context.read<AddAnnoucementsCubit>().selectedTime!),
                    style: AppTextStyles.font12BlackSemiBold
                        .copyWith(color: AppColors.darkGray)),
                hGap(20),
                SvgPicture.asset(Assets.imagesSvgsIosArrowIcon)
              ],
            )),
      ],
    );
  }
}
