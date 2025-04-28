import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/features/quizes/ui/cubit/add_quiz_cubit/add_quiz_cubit.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/app_assets.dart';
import '../../../../core/helpers/format_date_and_time_helpers.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_hollow_button.dart';
import '../../../../generated/l10n.dart';

class QuizDateAndTimePickers extends StatefulWidget {
  const QuizDateAndTimePickers({super.key});

  @override
  State<QuizDateAndTimePickers> createState() => _QuizDateAndTimePickersState();
}

class _QuizDateAndTimePickersState extends State<QuizDateAndTimePickers> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              //toDo:Date picker -------------------------------------------------------------------------------------
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
                          context.read<AddQuizCubit>().selectedDate =
                              DateFormat('yyyy/MM/dd', 'en_US').format(value);
                        });
                      }
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                          context.read<AddQuizCubit>().selectedDate ??
                              S.of(context).selectDate,
                          style: AppTextStyles.font11BlackSemiBold
                              .copyWith(color: AppColors.darkGray)),
                      const Spacer(),
                      SvgPicture.asset(Assets.imagesSvgsIosArrowIcon)
                    ],
                  )),
              //------------------------------------------------------------------------------------------------------
            ),
          ],
        ),
        vGap(5),
        Row(children: [
          Text(
            S.of(context).startsAt,
            style: AppTextStyles.font11BlackSemiBold
                .copyWith(color: AppColors.darkGray),
          ),
          hGap(5),
          //toDo:state time picker -------------------------------------------------------------------------------------
          Expanded(
            child: CustomHollowButton(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                borderWidth: 1,
                borderColor: AppColors.black,
                onPressed: () {
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        context.read<AddQuizCubit>().selectedStartTime =
                            '${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}:00';
                      });
                    }
                  });
                },
                child: Row(
                  children: [
                    Text(
                        context.read<AddQuizCubit>().selectedStartTime == null
                            ? S.of(context).selectTime
                            : FormatDateAndTimeHelpers.convertTo12HourFormat(
                                context
                                    .read<AddQuizCubit>()
                                    .selectedStartTime!),
                        style: AppTextStyles.font11BlackSemiBold
                            .copyWith(color: AppColors.darkGray)),
                    const Spacer(),
                    SvgPicture.asset(Assets.imagesSvgsIosArrowIcon)
                  ],
                )),
          ),
          //------------------------------------------------------------------------------------------------------
          hGap(10),
          Text(
            S.of(context).endsAt,
            style: AppTextStyles.font11BlackSemiBold
                .copyWith(color: AppColors.darkGray),
          ),
          hGap(10),
          //toDo:end time picker ---------------------------------------------------------------------------------
          Expanded(
            child: CustomHollowButton(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                borderWidth: 1,
                borderColor: AppColors.black,
                onPressed: () {
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        context.read<AddQuizCubit>().selectedEndTime =
                            '${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}';
                      });
                    }
                  });
                },
                child: Row(
                  children: [
                    Text(
                        context.read<AddQuizCubit>().selectedEndTime == null
                            ? S.of(context).selectTime
                            : FormatDateAndTimeHelpers.convertTo12HourFormat(
                                context.read<AddQuizCubit>().selectedEndTime!),
                        style: AppTextStyles.font11BlackSemiBold
                            .copyWith(color: AppColors.darkGray)),
                    const Spacer(),
                    SvgPicture.asset(Assets.imagesSvgsIosArrowIcon)
                  ],
                )),
          ),
          //------------------------------------------------------------------------------------------------------
        ]),
      ],
    );
  }
}
