import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/core/widgets/custom_drop_down_button.dart';
import 'package:grad_project/features/academic_progress/presentation/views/widgets/custom_percent_indicator.dart';
import 'package:grad_project/features/academic_progress/presentation/views/widgets/green_dot.dart';
import 'package:grad_project/features/academic_progress/presentation/views/widgets/labels_listview.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/generated/l10n.dart';

class AcademicProgressViewBody extends StatelessWidget {
  const AcademicProgressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomInnerScreensAppBar(title: S.of(context).academicProgress),
            TitleTextWidget(
              text: S.of(context).academic_progress_welcome_message,
            ),
            vGap(30),
            const CustomPercentIndicator(),
            vGap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const GreenDot(),
                hGap(5),
                Text(
                  S.of(context).percentage,
                  style: AppTextStyles.font16BlackSemiBold,
                ),
              ],
            ),
            vGap(15),
            Row(
              children: [
                CustomDropDownButton(
                  values: [
                    S.of(context).first_semester,
                    S.of(context).second_semester,
                  ],
                ),
                hGap(15),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Text(
                        "${S.of(context).number_of_subjects}: 6",
                        style: AppTextStyles.font14BlackSemiBold,
                      ),
                      hGap(10),
                      Text(
                        "${S.of(context).total}: 689",
                        style: AppTextStyles.font14BlackSemiBold,
                      ),
                    ],
                  ),
                )
              ],
            ),
            vGap(15),
            LabelsListView(
              labels: [
                S.of(context).subject,
                S.of(context).attendance,
                S.of(context).assignments,
                S.of(context).midterm,
                S.of(context).classWork,
                S.of(context).final_exam,
                S.of(context).total
              ],
            )
          ],
        ),
      ),
    );
  }
}
