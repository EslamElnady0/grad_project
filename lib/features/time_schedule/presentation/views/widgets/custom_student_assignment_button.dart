import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/time_schedule/data/models/activity_response_model.dart';
import 'package:grad_project/generated/l10n.dart';

class CustomStudentAssignmentButton extends StatelessWidget {
  final StudentAssignmentModel assignmentModel;

  const CustomStudentAssignmentButton({
    super.key,
    required this.assignmentModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          gradient: Constants.secondaryGrad,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(S.of(context).add_to_send,
              style: AppTextStyles.font12WhiteMedium),
        ),
      ),
    );
  }
}
