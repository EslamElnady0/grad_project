import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_white_drop_shadowed_container.dart';
import 'package:grad_project/features/assignments/data/models/assignment_answer_details_model.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_details_item.dart';
import 'package:grad_project/generated/l10n.dart';

class AssignmentDetailsSection extends StatelessWidget {
  const AssignmentDetailsSection({super.key, required this.answerStatus});

  final AnswerStatus? answerStatus;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        S.of(context).assignment_details,
        style: AppTextStyles.font16BlackSemiBold,
      ),
      vGap(12),
      CustomWhiteDropShadowedContainer(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AssignmentDetailsItem(
                  title: S.of(context).assignment_state,
                  value: answerStatus != null &&
                          answerStatus!.status == "corrected"
                      ? S.of(context).corrected
                      : S.of(context).not_corrected),
              hGap(10),
              AssignmentDetailsItem(
                  title: S.of(context).Submission_state,
                  value: answerStatus == null
                      ? S.of(context).assignment_not_submitted
                      : S.of(context).assignment_submitted),
              hGap(10),
              AssignmentDetailsItem(
                  title: S.of(context).assignment_degree,
                  value: answerStatus == null || answerStatus!.degree == 0
                      ? S.of(context).not_corrected
                      : answerStatus!.degree.toString()),
            ],
          )),
    ]);
  }
}
