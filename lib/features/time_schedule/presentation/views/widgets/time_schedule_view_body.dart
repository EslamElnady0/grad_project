import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/widgets/custom_drop_down_button.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/core/widgets/custom_search_text_field.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/features/time_schedule/presentation/views/widgets/task_widget.dart';
import 'package:grad_project/generated/l10n.dart';

class TimeScheduleViewBody extends StatelessWidget {
  const TimeScheduleViewBody({super.key});

  final List<bool> isQuiz = const [true, false, true, true, true, false];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 10.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomInnerScreensAppBar(title: S.of(context).timeSchedule),
            TitleTextWidget(
              text: S.of(context).time_schedule_welcome_message,
            ),
            vGap(15),
            CustomSearchTextField(
              hintText: S.of(context).search_for_task,
              controller: TextEditingController(),
            ),
            vGap(15),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDropDownButton(
                    initialValue: S.of(context).next_seven_days,
                    values: [S.of(context).next_seven_days],
                  ),
                  CustomDropDownButton(
                    initialValue: S.of(context).assignments,
                    values: [S.of(context).quizzes, S.of(context).assignments],
                  ),
                ],
              ),
            ),
            vGap(15),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return TaskWidget(isQuiz: isQuiz[index]);
              },
              separatorBuilder: (context, index) {
                return vGap(15);
              },
              itemCount: isQuiz.length,
            )
          ],
        ),
      ),
    );
  }
}
