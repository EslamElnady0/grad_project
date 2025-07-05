import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';

class EditSessionHeader extends StatelessWidget {
  const EditSessionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).edit_session_details,
          style: AppTextStyles.font16BlackBold,
        ),
        vGap(6),
        Text(
          S.of(context).edit_session_info,
          style: AppTextStyles.font12GrayMedium,
        ),
      ],
    );
  }
}
