import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/widgets/custom_white_drop_shadowed_container.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import 'quiz_details_item.dart';

class QuizDetailsSection extends StatelessWidget {
  const QuizDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).quizDetails,
          style: AppTextStyles.font16BlackSemiBold,
        ),
        vGap(12),
        CustomWhiteDropShadowedContainer(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Row(
            children: [
              QuizDetailsItem(
                  title: S.of(context).quizState,
                  value: S.of(context).didntStartYet),
              hGap(20),
              QuizDetailsItem(
                  title: S.of(context).classification,
                  value: S.of(context).classWork),
            ],
          ),
        ),
        vGap(12),
        CustomWhiteDropShadowedContainer(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Row(
            children: [
              QuizDetailsItem(
                  title: S.of(context).quizDuration,
                  value: S.of(context).minute),
              hGap(20),
              QuizDetailsItem(
                  title: S.of(context).numOfTimesAllowed,
                  value: S.of(context).once),
            ],
          ),
        ),
      ],
    );
  }
}
