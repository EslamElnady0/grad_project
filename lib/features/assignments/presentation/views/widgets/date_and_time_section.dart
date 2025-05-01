import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_hollow_button.dart';
import 'package:grad_project/features/assignments/logic/cubits/create_assignment_cubit/create_assignment_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/create_assignment_cubit/create_assignment_state.dart';

class DateAndTimeSection extends StatelessWidget {
  final bool isEdit;
  const DateAndTimeSection({super.key, this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateAssignmentCubit>();
    return BlocBuilder<CreateAssignmentCubit, CreateAssignmentState>(
      builder: (context, state) {
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
                        isEdit
                            ? cubit.selectDate(value)
                            : cubit.selectDate(value);
                      }
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                          (isEdit
                              ? cubit.selectedDate
                              : cubit.selectedDate),
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
                      isEdit
                          ? cubit.selectTime(value)
                          : cubit.selectTime(value);
                    }
                  });
                },
                child: Row(
                  children: [
                    Text(
                        (isEdit
                            ? cubit.selectedTime
                            : cubit.selectedTime),
                        style: AppTextStyles.font12BlackSemiBold
                            .copyWith(color: AppColors.darkGray)),
                    hGap(20),
                    SvgPicture.asset(Assets.imagesSvgsIosArrowIcon)
                  ],
                )),
          ],
        );
      },
    );
  }
}
