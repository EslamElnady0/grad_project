import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/custom_assignment_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomAssignmentWidgetSkeleton extends StatelessWidget {
  const CustomAssignmentWidgetSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 16,
              color: AppColors.black.withOpacity(0.16),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Loading...",
            style: AppTextStyles.font16DarkerBlueBold,
          ),
          vGap(10),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    "10:00",
                    style: AppTextStyles.font14DarkBlueMedium,
                  ),
                  Text(
                    "PM",
                    style: AppTextStyles.font14DarkBlueMedium,
                  )
                ],
              ),
              hGap(10),
              Skeleton.leaf(
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    gradient: Constants.secondaryGrad,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.imagesSvgsQuizIcon,
                      width: 30,
                    ),
                  ),
                ),
              ),
              hGap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Loading...",
                    style: AppTextStyles.font16DarkerBlueBold,
                  ),
                  vGap(8),
                  Text(
                    "Loading...",
                    style: AppTextStyles.font10GraySemiBold,
                  )
                ],
              ),
            ],
          ),
          vGap(15),
          const Skeleton.leaf(
            child: CustomAssignmentButton(
              isDone: true,
            ),
          )
        ],
      ),
    );
  }
}