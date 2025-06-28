import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/format_date_and_time_helpers.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_white_drop_shadowed_container.dart';
import 'package:grad_project/generated/l10n.dart';

class AssignmentDescSection extends StatelessWidget {
  const AssignmentDescSection(
      {super.key,
      this.assignmentModel,
      this.description,
      this.date,
      this.time});
  final dynamic assignmentModel;
  final String? description;
  final String? date;
  final String? time;
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
                assignmentModel?.description ?? description ?? description!,
                style: AppTextStyles.font12BlackSemiBold,
              ),
              const Divider(),
              Text(
                "${S.of(context).deadline} : ${FormatDateAndTimeHelpers.formatDateToDayFullMonthAndYear(assignmentModel?.date??date??date!, context)}\nالساعة ${FormatDateAndTimeHelpers.convertTo12HourFormat(
                  assignmentModel?.time??time??time!.substring(0, 5),
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
