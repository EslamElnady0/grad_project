import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

import '../../../../../generated/l10n.dart';

void showStatsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.darkblue,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(S.of(context).question_statistics,
                  style: AppTextStyles.font16GrayBold),
              const SizedBox(height: 8),
              _buildStatRow(
                  Assets.imagesSvgsLike, S.of(context).interested, "69"),
              _buildStatRow(
                  Assets.imagesSvgsAnswers, S.of(context).answer, "8"),
              _buildStatRow(
                  Assets.imagesSvgsVisibility, S.of(context).view, "126"),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildStatRow(String icon, String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              icon,
              color: Colors.white,
              width: 25,
              height: 25,
            ),
            hGap(20),
            SizedBox(
              width: 50,
              child: Text(
                value,
                style: AppTextStyles.font20WhiteSemiBold,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        hGap(20),
        Text(
          label,
          style: AppTextStyles.font20WhiteSemiBold,
        ),
      ],
    ),
  );
}
