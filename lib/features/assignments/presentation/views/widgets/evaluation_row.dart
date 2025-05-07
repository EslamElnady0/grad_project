import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/grade_selector.dart';
import 'package:grad_project/generated/l10n.dart';

class EvaluationRow extends StatelessWidget {
  const EvaluationRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).select_all_to_give_degree,
            style: AppTextStyles.font14DarkerBlueSemiBold,
          ),
          hGap(5),
          const Expanded(
            child: GradeSelector(),
          ),
        ],
      ),
    );
  }
}
