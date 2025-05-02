import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/format_date_and_time_helpers.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_white_drop_shadowed_container.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../data/models/get_quizzes_response.dart';

class QuizDescSection extends StatelessWidget {
  const QuizDescSection({super.key});

  @override
  Widget build(BuildContext context) {
    final quizModel = context.read<QuizModel>();
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
                quizModel.description,
                style: AppTextStyles.font10BlackMedium,
              ),
              const Divider(),
              Text(
                "يبدأ في : ${FormatDateAndTimeHelpers.formatDateToDayFullMonthAndYear(quizModel.date, context)} ، الساعة ${FormatDateAndTimeHelpers.convertTo12HourFormat(
                  quizModel.startTime.substring(0, 5),
                )}",
                style: AppTextStyles.font8BlackSemiBold,
              ),
            ],
          ),
        )
      ],
    );
  }
}
