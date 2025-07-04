import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/assignments/data/models/assignment_answers_model.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/custom_show_button.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/grade_selector.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/student_degree_display.dart';

class AssignmentRow extends StatelessWidget {
  const AssignmentRow({
    super.key,
    required this.answer,
    required this.totalDegree,
  });
  final Answer answer;
  final int totalDegree;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  answer.student,
                  style: AppTextStyles.font12DarkerBlueSemiBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          hGap(10),
          SizedBox(
            width: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  answer.code,
                  style: AppTextStyles.font12DarkerBlueSemiBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          hGap(10),
          CustomShowButton(
            fileUrl: answer.fileUrl,
          ),
          hGap(15),
          StudentDegreeDisplay(
            answerId: answer.id,
            initialDegree: answer.degree,
          ),
          hGap(15),
          SizedBox(
            width: 50,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                totalDegree.toString(),
                style: AppTextStyles.font12DarkerBlueSemiBold,
              ),
            ),
          ),
          hGap(20),
          GradeSelector(
            totalDegree: totalDegree,
            answerId: answer.id,
          ),
          hGap(10),
        ],
      ),
    );
  }
}
