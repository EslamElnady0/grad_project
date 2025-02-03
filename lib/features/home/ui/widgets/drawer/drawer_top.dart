import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_dark_blue_container.dart';
import 'package:grad_project/generated/l10n.dart';

class DrawerTop extends StatelessWidget {
  const DrawerTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomDarkBlueContainer(
          height: 161.h,
          width: double.infinity,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
        ),
        Center(
          child: Column(
            children: [
              vGap(5),
              Image.asset(Assets.imagesSplash, height: 105.h, width: 105.w),
              Text(
                S.of(context).eLearning,
                style: AppTextStyles.font16WhiteSemiBold,
              )
            ],
          ),
        )
      ],
    );
  }
}
