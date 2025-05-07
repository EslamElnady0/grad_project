import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';

class GradeSelector extends StatelessWidget {
  const GradeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: AppColors.backGround,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Text(
                "5",
                style: AppTextStyles.font14DarkBlueMedium,
              ),
              hGap(10),
              Column(
                children: [
                  SvgPicture.asset(Assets.imagesSvgsIncreaseIcon),
                  vGap(8),
                  SvgPicture.asset(Assets.imagesSvgsDecreaseIcon),
                ],
              )
            ],
          ),
        ),
        hGap(5),
        Container(
          height: 38,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: Constants.secondaryGrad),
          child: TextButton(
            onPressed: () {},
            child: Text(
              S.of(context).evaluation,
              style: AppTextStyles.font12WhiteSemiBold,
            ),
          ),
        )
      ],
    );
  }
}