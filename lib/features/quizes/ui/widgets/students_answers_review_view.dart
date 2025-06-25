import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/quizes/ui/widgets/custom_student_review_question_widget.dart';
import '../../../../core/widgets/custom_inner_screens_app_bar.dart';
import '../../../../generated/l10n.dart';

class StudentsAnswersReviewViewBody extends StatelessWidget {
  const StudentsAnswersReviewViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return symmetricPaddingWidget(
      child: Column(
        children: [
          vGap(10),
          CustomInnerScreensAppBar(title: S.of(context).studentsAnswersReview),
          vGap(10),
          const CustomStudentReviewQuestionWidget()
        ],
      ),
    );
  }
}
