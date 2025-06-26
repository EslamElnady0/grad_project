import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_hollow_button.dart';
import 'package:grad_project/core/widgets/custom_white_drop_shadowed_container.dart';
import 'package:grad_project/generated/l10n.dart';

import '../cubit/quiz_navigation_cubit/quiz_question_navigation_cubit.dart';
import 'clear_answer_button.dart';

class QuizQuestionsManagement extends StatelessWidget {
  final int totalQuestions;
  const QuizQuestionsManagement({super.key, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return CustomWhiteDropShadowedContainer(
      child: Row(
        children: [
          CustomHollowButton(
              borderColor: AppColors.darkblue,
              onPressed: () {
                context.read<QuizQuestionNavigatorCubit>().next(totalQuestions);
              },
              child: Text(
                S.of(context).next,
                style: AppTextStyles.font10BlackMedium
                    .copyWith(color: AppColors.darkblue),
              )),
          const Spacer(),
          const ClearAnswerButton(),
          const Spacer(),
          CustomHollowButton(
              borderColor: AppColors.darkblue,
              onPressed: () {
                context.read<QuizQuestionNavigatorCubit>().previous();
              },
              child: Text(
                S.of(context).previous,
                style: AppTextStyles.font10BlackMedium
                    .copyWith(color: AppColors.darkblue),
              )),
        ],
      ),
    );
  }
}
