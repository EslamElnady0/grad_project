import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/assignments/data/models/get_assignments_response_model.dart';
import 'package:grad_project/features/assignments/presentation/views/assignment_details_view.dart';
import 'package:grad_project/features/assignments/presentation/views/assignment_results_view.dart';
import 'package:grad_project/generated/l10n.dart';

class CustomAssignmentButton extends StatelessWidget {
  final AssignmentModel? assignmentModel;
  final bool isDone;

  const CustomAssignmentButton({
    super.key,
    required this.isDone,
    this.assignmentModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isDone
            ? GoRouter.of(context).push(AssignmentResultsView.routeName)
            : GoRouter.of(context)
                .push(AssignmentDetailsView.routeName, extra: assignmentModel);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          gradient: isDone ? Constants.secondaryGrad : null,
          color: isDone ? null : AppColors.darkblue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
              isDone ? S.of(context).results : S.of(context).assignment_details,
              style: AppTextStyles.font12WhiteMedium),
        ),
      ),
    );
  }
}
