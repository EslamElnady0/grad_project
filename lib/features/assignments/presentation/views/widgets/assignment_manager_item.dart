import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/localizationa.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_text_and_icon_button.dart';
import 'package:grad_project/generated/l10n.dart';

class AssignmentManagerItem extends StatelessWidget {
  const AssignmentManagerItem({super.key});

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
          child: Image.asset(Assets.imagesSubject),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 16.h),
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
                    "عدد الطلاب المسجلين بالمادة: 350",
                    textAlign: TextAlign.start,
                    style: AppTextStyles.font16GrayMedium,
                  ),
                ),
              ),
              vGap(12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(children: [
                  CustomTextAndIconButton(
                      text: S.of(context).create_assigment,
                      width: double.infinity,
                      onTap: () {},
                      icon: Image.asset(Assets.imagesSvgsAddIcon),
                      primaryButton: true),
                  vGap(12),
                  CustomTextAndIconButton(
                      text: S.of(context).scheduled_assignments,
                      width: double.infinity,
                      onTap: () {},
                      icon: Image.asset(Assets.imagesSvgsScheduledIcon),
                      primaryButton: true),
                  vGap(12),
                  CustomTextAndIconButton(
                      text: S.of(context).previous_assignments,
                      width: double.infinity,
                      onTap: () {},
                      icon: Image.asset(Assets.imagesSvgsPreviousIcon),
                      primaryButton: false),
                ]),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
