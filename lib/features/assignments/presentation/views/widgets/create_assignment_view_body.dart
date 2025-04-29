import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_degree_widget.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/date_and_time_section.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/title_and_desc_text_fields.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/generated/l10n.dart';

class CreateAssignmentViewBody extends StatelessWidget {
  const CreateAssignmentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInnerScreensAppBar(
                title: S.of(context).create_new_assignment),
            TitleTextWidget(
                text: S.of(context).create_assignment_welcome_message),
            vGap(8),
            /*TitleAndDescTextFields(
              title: S.of(context).assignment_title,
              titleHintText: S.of(context).assignment_title_hint_text,
              desc: S.of(context).assignment_description,
              descHintText: S.of(context).assignment_description_hint_text,
              formKey: context.read<AddAnnoucementsCubit>().formKey,
              titleController:
                  context.read<AddAnnoucementsCubit>().titleController,
              descController:
                  context.read<AddAnnoucementsCubit>().descController,
            ),*/
            vGap(12),
            Row(
              children: [
                AssignmentDegreeWidget(),
              ],
            ),
            vGap(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).final_date,
                  style: AppTextStyles.font14BlackBold
                      .copyWith(color: AppColors.darkerBlue),
                ),
                vGap(12),
                Text(S.of(context).choose_assignment_deadline,
                    style: AppTextStyles.font12GrayMedium),
              ],
            ),
            vGap(8),
            const DateAndTimeSection(),
            const DateAndTimeSection(),
            vGap(20),
            /*PublishRow(
              onTap: () async {
                if (context
                    .read<AddAnnoucementsCubit>()
                    .formKey
                    .currentState!
                    .validate()) {
                  await context.read<AddAnnoucementsCubit>().addAnnoucement();
                }
              },
            ),*/
          ],
        ),
      ),
    );
  }
}
