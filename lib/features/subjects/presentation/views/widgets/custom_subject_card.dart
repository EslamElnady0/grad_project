import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/helpers/localizationa.dart';
import 'package:grad_project/core/widgets/custom_text_button.dart';
import '../../../../../core/helpers/app_assets.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class CustomSubjectCard extends StatelessWidget {
  const CustomSubjectCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 9.w),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.r),
            topRight: Radius.circular(22.r),
          )),
          child: Stack(children: [
            Image.asset(Assets.imagesSubject),
            Positioned(
                top: 20.h,
                right: 18.w,
                child: SvgPicture.asset(Assets.imagesSvgsStarIcon))
          ]),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22.r),
              bottomRight: Radius.circular(22.r),
            ),
          ),
          child: Column(
            children: [
              vGap(12),
              Align(
                alignment: isArabicLocale(context)
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    "البرمجة كائنية التوجه “OOP”",
                    textAlign: TextAlign.start,
                    style: AppTextStyles.font20DarkerBlueBold,
                  ),
                ),
              ),
              Align(
                alignment: isArabicLocale(context)
                    ? Alignment.topLeft
                    : Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    "د. أحمد المنوفي",
                    textAlign: TextAlign.start,
                    style: AppTextStyles.font16GrayMedium,
                  ),
                ),
              ),
              vGap(12),
              const Divider(
                color: AppColors.gray,
                thickness: 1,
                height: 20,
              ),
              vGap(12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(children: [
                  CustomTextButton(
                      width: 120.w, text: S.of(context).study, onTap: () {}),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColors.veryLightCyan,
                      borderRadius: BorderRadius.circular(16), // تدوير الزوايا
                    ),
                    child: Text(
                      '85% مكتمل',
                      style: AppTextStyles.font16GreenSemiBold,
                    ),
                  ),
                ]),
              ),
              vGap(18),
            ],
          ),
        )
      ]),
    );
  }
}
