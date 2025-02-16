import 'package:flutter/widgets.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/l10n.dart';

class QuizAdvicesSection extends StatelessWidget {
  const QuizAdvicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).quizAdvices,
          style: AppTextStyles.font16BlackSemiBold,
        ),
      ],
    );
  }
}
