import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/time_schedule/presentation/views/widgets/custom_button.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required this.isQuiz,
  });

  final bool isQuiz;
  @override
  Widget build(BuildContext context) {
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
            "السبت، 2 نوفمبر 2024",
            style: AppTextStyles.font16DarkerBlueBold,
          ),
          vGap(10),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    '08:00',
                    style: AppTextStyles.font14DarkBlueMedium,
                  ),
                  Text(
                    'مساءً',
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
                    isQuiz
                        ? Assets.imagesSvgsQuizIcon
                        : Assets.imagesSvgsAssignmentsIcon,
                    width: 30,
                  ),
                ),
              ),
              hGap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'اختبار الاسبوع الرابع',
                    style: AppTextStyles.font16DarkerBlueBold,
                  ),
                  vGap(8),
                  Text(
                    'كويز - البرمجة الشيئية (OOP)',
                    style: AppTextStyles.font10GraySemiBold,
                  )
                ],
              ),
            ],
          ),
          vGap(15),
          CustomButton(
            isQuiz: isQuiz,
          )
        ],
      ),
    );
  }
}
