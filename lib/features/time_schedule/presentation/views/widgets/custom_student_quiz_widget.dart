import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/format_date_and_time_helpers.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/time_schedule/data/models/activity_response_model.dart';
import 'package:grad_project/features/time_schedule/presentation/views/widgets/custom_student_quiz_button.dart';

class CustomStudentQuizWidget extends StatelessWidget {
  final StudentQuizModel quizModel;
  const CustomStudentQuizWidget({
    super.key,
    required this.quizModel,
  });

  @override
  Widget build(BuildContext context) {
    String startTime = FormatDateAndTimeHelpers.convertTo12HourFormat(
      quizModel.time.substring(0, 5),
    ).substring(0, 5);
    String timePeriod = FormatDateAndTimeHelpers.convertTo12HourFormat(
      quizModel.time.substring(0, 5),
    ).substring(5, 8);
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
                quizModel.date, context),
            style: AppTextStyles.font16DarkerBlueBold,
          ),
          vGap(10),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    startTime,
                    style: AppTextStyles.font14DarkBlueMedium,
                  ),
                  Text(
                    timePeriod,
                    style: AppTextStyles.font14DarkBlueMedium,
                  )
                ],
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
                    Assets.imagesSvgsQuizIcon,
                    width: 30,
                  ),
                ),
              ),
              hGap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quizModel.title,
                    style: AppTextStyles.font16DarkerBlueBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  vGap(8),
                  Text(
                    quizModel.course.name,
                    style: AppTextStyles.font10GraySemiBold,
                  )
                ],
              ),
            ],
          ),
          vGap(15),
          CustomStudentQuizButton(
            studentQuizModel: quizModel,
          )
        ],
      ),
    );
  }
}
