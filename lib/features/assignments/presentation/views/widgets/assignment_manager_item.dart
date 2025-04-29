import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/data/models/teachers_courses_response.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_text_and_icon_button.dart';
import 'package:grad_project/features/assignments/presentation/views/create_assignment_view.dart';
import 'package:grad_project/generated/l10n.dart';

class AssignmentManagerItem extends StatelessWidget {
  const AssignmentManagerItem({super.key, required this.courseData});
  final CourseResponse courseData;
  @override
  Widget build(BuildContext context) {
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
              courseData.name ??"",
              style: AppTextStyles.font20DarkerBlueBold,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 15.w),
            child: Text(
              courseData.description??"",
              style: AppTextStyles.font12GraySemiBold,
            ),
          ),
          vGap(12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                CustomTextAndIconButton(
                  text: S.of(context).create_assignment,
                  style: AppTextStyles.font14WhiteMedium,
                  width: double.infinity,
                  onTap: () {
                    GoRouter.of(context).push(CreateAssignmentView.routeName);
                  },
                  icon: SvgPicture.asset(Assets.imagesSvgsAddIcon),
                  primaryButton: true,
                ),
                vGap(12),
                CustomTextAndIconButton(
                  text: S.of(context).scheduled_assignments,
                  style: AppTextStyles.font14WhiteMedium,
                  width: double.infinity,
                  onTap: () {},
                  icon: SvgPicture.asset(Assets.imagesSvgsScheduledIcon),
                  primaryButton: true,
                ),
                vGap(12),
                CustomTextAndIconButton(
                  text: S.of(context).previous_assignments,
                  style: AppTextStyles.font14WhiteMedium,
                  width: double.infinity,
                  onTap: () {},
                  icon: SvgPicture.asset(Assets.imagesSvgsPreviousIcon),
                  primaryButton: false,
                ),
              ],
            ),
          ),
          vGap(20)
        ],
      ),
    );
  }
}
