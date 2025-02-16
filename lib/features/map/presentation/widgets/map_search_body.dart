import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/inner_shadow.dart';
import 'package:grad_project/generated/l10n.dart';

import '../../../../core/widgets/custom_secondary_gradient_button.dart';

class MapSearchBody extends StatelessWidget {
  const MapSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(
        Assets.imagesMapPlaceHolder,
      ),
      vGap(14),
      InnerShadow(
        shadows: [
          BoxShadow(blurRadius: 3, color: AppColors.black.withOpacity(0.15))
        ],
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 22.w),
          decoration: BoxDecoration(
              color: AppColors.veryLightCyan,
              borderRadius: BorderRadius.circular(24)),
          child: Column(
            children: [
              //location
              Row(children: [
                SvgPicture.asset(Assets.imagesSvgsLocationIcon),
                hGap(16),
                Text(
                  "مبني علوم حاسب - مدرج 7",
                  style: AppTextStyles.font12BlackSemiBold,
                ),
              ]),
              vGap(10),
              //decoration
              Row(children: [
                hGap(3.5),
                SvgPicture.asset(Assets.imagesSvgsThreeDotsIcon),
                Spacer(),
                SvgPicture.asset(Assets.imagesSvgsArrowUpArrowDownIcon),
              ]),
              vGap(10),
              //where are you going
              Row(children: [
                hGap(2),
                SvgPicture.asset(Assets.imagesSvgsCircleIcon),
                hGap(16),
                Text(
                  S.of(context).whereAreYouGoingBoss,
                  style: AppTextStyles.font12BlackSemiBold,
                ),
              ]),
            ],
          ),
        ),
      ),
      vGap(16),
      CustomSecondaryGradientButton(
        onTap: () {},
        title: S.of(context).start,
      )
    ]);
  }
}
