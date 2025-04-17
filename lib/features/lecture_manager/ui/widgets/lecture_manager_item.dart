
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/features/lecture_manager/ui/screens/qr_attendance_view.dart';

import '../../../../core/helpers/app_assets.dart';
import '../../../../core/helpers/localizationa.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_text_and_icon_button.dart';
import '../../../../generated/l10n.dart';

class LectureManagerItem extends StatelessWidget {
  const LectureManagerItem({
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
                      text: S.of(context).qr_attendance,
                      width: double.infinity,
                      onTap: () {
                        GoRouter.of(context).push(QrAttendanceView.routeName);
                      },
                      icon: Image.asset(Assets.imagesQr),
                      primaryButton: true),
                  vGap(12),
                  CustomTextAndIconButton(
                      text: S.of(context).add_courses,
                      width: double.infinity,
                      onTap: () {},
                      icon: Image.asset(Assets.imagesAddLecture),
                      primaryButton: true),
                  vGap(12),
                  CustomTextAndIconButton(
                      text: S.of(context).update_lecture_status,
                      width: double.infinity,
                      onTap: () {},
                      icon: Image.asset(Assets.imagesStateUpdate),
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
