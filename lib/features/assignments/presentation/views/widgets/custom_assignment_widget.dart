import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/format_date_and_time_helpers.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/assignments/data/models/get_assignments_response_model.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/custom_assignment_button.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomAssignmentWidget extends StatelessWidget {
  const CustomAssignmentWidget({super.key, required this.assignmentModel});

  final AssignmentModel assignmentModel;
  @override
  Widget build(BuildContext context) {
    String time = FormatDateAndTimeHelpers.convertTo12HourFormat(
      assignmentModel.time.substring(0, 5),
    ).substring(0, 5);
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 16,
              color: AppColors.black.withOpacity(0.16),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            FormatDateAndTimeHelpers.formatDateToDayFullMonthAndYear(
                assignmentModel.date, context),
            style: AppTextStyles.font16DarkerBlueBold,
          ),
          vGap(10),
          Row(
            children: [
              SizedBox(
                width: 50,
                child: Column(
                  children: [
                    Text(
                      time,
                      style: AppTextStyles.font14DarkBlueMedium,
                    ),
                  ],
                ),
              ),
              hGap(10),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  gradient: Constants.secondaryGrad,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Assets.imagesSvgsAssignmentsIcon,
                    width: 30,
                  ),
                ),
              ),
              hGap(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      assignmentModel.title,
                      style: AppTextStyles.font16DarkerBlueBold,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    vGap(8),
                    Text(
                      "${S.of(context).assignment}   ${assignmentModel.course.name}",
                      style: AppTextStyles.font10GraySemiBold,
                    )
                  ],
                ),
              ),
            ],
          ),
          vGap(15),
          CustomAssignmentButton(
            isDone: assignmentModel.status == "finished",
            assignmentModel: assignmentModel,
          )
        ],
      ),
    );
  }
}




