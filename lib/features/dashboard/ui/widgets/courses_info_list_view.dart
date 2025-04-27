import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/dashboard/ui/widgets/custom_red_course_button.dart';
import 'package:grad_project/features/subjects/presentation/views/materials_view.dart';
import 'package:grad_project/generated/l10n.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';

class CoursesInfoListView extends StatelessWidget {
  const CoursesInfoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          clipBehavior: Clip.antiAlias,
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
                child: CustomRedCourseButton(
                    text: S.of(context).registered_students, onTap: () {}),
              ),
              vGap(10),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
                child: CustomRedCourseButton(
                    text: S.of(context).view_curriculum,
                    onTap: () {
                      GoRouter.of(context).push(MaterialsView.routeName);
                    }),
              ),
              vGap(20)
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => vGap(12),
      itemCount: 10,
    );
  }
}
