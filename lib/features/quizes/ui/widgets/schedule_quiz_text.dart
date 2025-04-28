import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';

class ScheduleQuizText extends StatelessWidget {
  const ScheduleQuizText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).scheduleQuiz,
          style: AppTextStyles.font14BlackBold
              .copyWith(color: AppColors.darkerBlue),
        ),
        vGap(5),
        Text(S.of(context).scheduleQuizHelper,
            style: AppTextStyles.font12GrayMedium),
      ],
    );
  }
}
