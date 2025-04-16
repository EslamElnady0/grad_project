import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/widgets/custom_hollow_button.dart';
import '../../../../core/helpers/app_assets.dart';
import '../../../../core/theme/app_text_styles.dart';

class DateAndTimeSection extends StatelessWidget {
  const DateAndTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomHollowButton(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              borderWidth: 1,
              borderColor: AppColors.black,
              onPressed: () {},
              child: Row(
                children: [
                  Text("2025/01/25",
                      style: AppTextStyles.font12BlackSemiBold
                          .copyWith(color: AppColors.darkGray)),
                  const Spacer(),
                  SvgPicture.asset(Assets.imagesSvgsIosArrowIcon)
                ],
              )),
        ),
        hGap(30),
        CustomHollowButton(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            borderWidth: 1,
            borderColor: AppColors.black,
            onPressed: () {},
            child: Row(
              children: [
                Text("12:00 ص",
                    style: AppTextStyles.font12BlackSemiBold
                        .copyWith(color: AppColors.darkGray)),
                hGap(25),
                SvgPicture.asset(Assets.imagesSvgsIosArrowIcon)
              ],
            )),
      ],
    );
  }
}
