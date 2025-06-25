import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/data/models/teachers_courses_response.dart';
import 'package:grad_project/features/subjects/ui/views/add_lecture_view.dart';
import 'package:grad_project/features/subjects/ui/views/materials_view.dart';
import 'package:grad_project/features/subjects/ui/views/qr_attendance_view.dart';
import 'package:grad_project/features/subjects/ui/widgets/show_update_lecture_status_dialog.dart';

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
    required this.courseData,
  });
  final CourseResponse courseData;
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
                    courseData.name ?? "",
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
                    courseData.description ?? "",
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
                      text: S.of(context).manage_materials_and_display,
                      width: double.infinity,
                      onTap: () {
                         GoRouter.of(context).push(MaterialsView.routeName ,
                              extra: courseData.id);
                      },
                      icon:const Icon( Icons.library_books ,
                          color: AppColors.white),
                      primaryButton: true),
                  vGap(12),
                  CustomTextAndIconButton(
                      text: S.of(context).add_courses,
                      width: double.infinity,
                      onTap: () {
                        GoRouter.of(context).push(AddLectureView.routeName,
                            extra: courseData.id);
                      },
                      icon: Image.asset(Assets.imagesAddLecture),
                      primaryButton: true),
                  vGap(12),
                  CustomTextAndIconButton(
                      text: S.of(context).update_lecture_status,
                      width: double.infinity,
                      onTap: () {
                        showUpdateLectureStatusDialog(context);
                      },
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
