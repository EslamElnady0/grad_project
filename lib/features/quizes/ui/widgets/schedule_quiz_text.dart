import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';

class ScheduleQuizText extends StatelessWidget {
  final GlobalKey dateTimePickerKey;
  const ScheduleQuizText({super.key, required this.dateTimePickerKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).scheduleQuiz,
          key: dateTimePickerKey,
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
