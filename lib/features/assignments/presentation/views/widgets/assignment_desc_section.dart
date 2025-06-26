import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/format_date_and_time_helpers.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_white_drop_shadowed_container.dart';
import 'package:grad_project/features/assignments/data/models/get_assignments_response_model.dart';
import 'package:grad_project/generated/l10n.dart';

class AssignmentDescSection extends StatelessWidget {
  const AssignmentDescSection({super.key, required this.assignmentModel});
  final AssignmentModel assignmentModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).quizDesc,
          style: AppTextStyles.font16BlackSemiBold,
        ),
        vGap(10),
        CustomWhiteDropShadowedContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                assignmentModel.description,
                style: AppTextStyles.font12BlackSemiBold,
              ),
              const Divider(),
              Text(
                "${S.of(context).deadline} : ${FormatDateAndTimeHelpers.formatDateToDayFullMonthAndYear(assignmentModel.date, context)}\nالساعة ${FormatDateAndTimeHelpers.convertTo12HourFormat(
                  assignmentModel.time.substring(0, 5),
                )}",
                style: AppTextStyles.font12BlackSemiBold,
              ),
            ],
          ),
        )
      ],
    );
  }
}
