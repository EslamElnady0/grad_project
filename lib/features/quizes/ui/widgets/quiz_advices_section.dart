import 'package:flutter/widgets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../models/quiz_advice_model.dart';
import 'quiz_advice_item.dart';

class QuizAdvicesSection extends StatelessWidget {
  const QuizAdvicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<QuizAdviceModel> localizedQuizAdvices =
        Constants.localizedQuizAdviceList(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).quizAdvices,
          style: AppTextStyles.font16BlackSemiBold,
        ),
        vGap(12),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return QuizAdviceItem(
                value: localizedQuizAdvices[index].description,
                title: localizedQuizAdvices[index].title,
                index: index + 1,
              );
            },
            separatorBuilder: (context, index) => vGap(12),
            itemCount: localizedQuizAdvices.length)
      ],
    );
  }
}
