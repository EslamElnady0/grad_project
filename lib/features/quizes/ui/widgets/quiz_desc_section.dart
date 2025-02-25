import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_white_drop_shadowed_container.dart';
import 'package:grad_project/generated/l10n.dart';

class QuizDescSection extends StatelessWidget {
  const QuizDescSection({super.key});

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
                "يركز الاختبار على قدرة الطالب على إنشاء الدوال واستخدامها داخل الفئات (Classes) بشكل فعال، مع فهم كيفية تمرير البيانات (Parameters) وإرجاع القيم (Return Values).",
                style: AppTextStyles.font10BlackMedium,
              ),
              const Divider(),
              Text(
                "يبدأ في : الخميس 31 أكتوبر 2024 ، الساعة 12:59 صباحاً\nالموعد النهائي : الخميس 31 أكتوبر 2024 ، الساعة 01:14 صباحاً",
                style: AppTextStyles.font8BlackSemiBold,
              ),
            ],
          ),
        )
      ],
    );
  }
}
