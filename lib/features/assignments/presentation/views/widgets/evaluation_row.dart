import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';

class EvaluationRow extends StatelessWidget {
  const EvaluationRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
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
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 7),
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
                      vGap(12),
                      SvgPicture.asset(Assets.imagesSvgsDecreaseIcon),
                    ],
                  )
                ],
              ),
            ),
          ),
          hGap(5),
          Container(
            height: 40,
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
      ),
    );
  }
}
