import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/data/models/teachers_courses_response.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/dashboard/ui/widgets/custom_red_course_button.dart';
import 'package:grad_project/features/subjects/ui/views/materials_view.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';

class CustomDashboardCourseContainer extends StatelessWidget {
  final CourseResponse course;
  const CustomDashboardCourseContainer({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 16,
              color: AppColors.black.withOpacity(0.1),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            Assets.imagesSubjectC,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          vGap(10),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 15.w),
            child: Text(
              course.name ?? "اسم مادة افتراضي",
              style: AppTextStyles.font20DarkerBlueBold,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 15.w),
            child: Text(
              "${S.of(context).registered_students_count} 0",
              style: AppTextStyles.font12GraySemiBold,
            ),
          ),
          vGap(12),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
            child: Skeleton.leaf(
              child: CustomRedCourseButton(
                  text: S.of(context).registered_students, onTap: () {}),
            ),
          ),
          vGap(10),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
            child: Skeleton.leaf(
              child: CustomRedCourseButton(
                  text: S.of(context).view_curriculum,
                  onTap: () {
                    GoRouter.of(context).push(MaterialsView.routeName);
                  }),
            ),
          ),
          vGap(20)
        ],
      ),
    );
  }
}

class CustomDashboardCourseContainerSkeleton extends StatelessWidget {
  const CustomDashboardCourseContainerSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 16,
              color: AppColors.black.withOpacity(0.1),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            Assets.imagesSubjectC,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          vGap(10),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 15.w),
            child: Text(
              "البرمجة كائنية التوجه “OOP”",
              style: AppTextStyles.font20DarkerBlueBold,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 15.w),
            child: Text(
              "${S.of(context).registered_students_count} 20",
              style: AppTextStyles.font12GraySemiBold,
            ),
          ),
          vGap(12),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
            child: Skeleton.leaf(
              child: CustomRedCourseButton(
                  text: S.of(context).registered_students, onTap: () {}),
            ),
          ),
          vGap(10),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
            child: Skeleton.leaf(
              child: CustomRedCourseButton(
                  text: S.of(context).view_curriculum,
                  onTap: () {
                    GoRouter.of(context).push(MaterialsView.routeName);
                  }),
            ),
          ),
          vGap(20)
        ],
      ),
    );
  }
}
