import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/quizes/ui/views/quiz_details_view.dart';
import 'package:grad_project/generated/l10n.dart';

class CustomButton extends StatelessWidget {
  final bool isQuiz;

  const CustomButton({
    super.key,
    required this.isQuiz,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isQuiz
          ? () {
              GoRouter.of(context).push(QuizDetailsView.routeName);
            }
          : () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          gradient: isQuiz ? null : Constants.secondaryGrad,
          color: isQuiz ? AppColors.darkblue : null,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
              isQuiz ? S.of(context).quizDetails : S.of(context).add_to_send,
              style: AppTextStyles.font12WhiteMedium),
        ),
      ),
    );
  }
}
