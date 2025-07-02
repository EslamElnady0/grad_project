import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/quizes/data/models/get_quizzes_response.dart';
import 'package:grad_project/features/quizes/ui/views/quiz_details_view.dart';
import 'package:grad_project/features/time_schedule/data/models/activity_response_model.dart';
import 'package:grad_project/generated/l10n.dart';

import '../../../../quizes/ui/models/student_answers_review_navigation.dart';
import '../../../../quizes/ui/views/students_answers_review_view.dart';

class CustomStudentQuizButton extends StatelessWidget {
  final StudentQuizModel studentQuizModel;

  const CustomStudentQuizButton({
    super.key,
    required this.studentQuizModel,
  });

  @override
  Widget build(BuildContext context) {
    final QuizModel quizModel = QuizModel(
        id: studentQuizModel.id,
        title: studentQuizModel.title,
        description: studentQuizModel.description,
        totalDegree: studentQuizModel.totalDegree,
        date: studentQuizModel.date,
        startTime: studentQuizModel.time,
        duration: studentQuizModel.duration,
        status: studentQuizModel.status,
        course: studentQuizModel.course,
        teacher: studentQuizModel.teacher);
    return GestureDetector(
      onTap: () {
        studentQuizModel.status == 'finished'
            ? GoRouter.of(context).push(StudentsAnswersReviewView.routeName,
                extra: StudentAnswersReviewNavigation(
                  quizId: studentQuizModel.id.toString(),
                ))
            : GoRouter.of(context)
                .push(QuizDetailsView.routeName, extra: quizModel);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          gradient:
              quizModel.status != 'finished' ? Constants.secondaryGrad : null,
          color: quizModel.status == 'finished' ? AppColors.darkblue : null,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
              quizModel.status == 'finished'
                  ? S.of(context).studentsAnswersReview
                  : S.of(context).quizDetails,
              style: AppTextStyles.font12WhiteMedium),
        ),
      ),
    );
  }
}
