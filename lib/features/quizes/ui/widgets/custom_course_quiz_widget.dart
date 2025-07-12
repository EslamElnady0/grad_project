import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/data/models/teachers_courses_response.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/quizes/data/models/get_quizzes_request_query_params_model.dart';
import 'package:grad_project/features/quizes/ui/views/add_quiz_view.dart';
import 'package:grad_project/features/quizes/ui/views/teacher_quizzes_view.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_text_and_icon_button.dart';

class CustomCourseQuizWidget extends StatelessWidget {
  final CourseResponse course;
  const CustomCourseQuizWidget({super.key, required this.course});

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
            padding: EdgeInsetsDirectional.only(start: 15.w, end: 15.w),
            child: Text(
              course.description ?? "وصف مادة افتراضي",
              style: AppTextStyles.font12GraySemiBold,
            ),
          ),
          vGap(12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(children: [
              CustomTextAndIconButton(
                  text: S.of(context).createQuiz,
                  width: double.infinity,
                  style: AppTextStyles.font14WhiteSemiBold,
                  onTap: () {
                    GoRouter.of(context)
                        .push(AddQuizView.routeName, extra: course.id);
                  },
                  icon: SvgPicture.asset(Assets.imagesSvgsAddIcon),
                  primaryButton: true),
              vGap(12),
              CustomTextAndIconButton(
                  text: S.of(context).scheduled_quizzes,
                  width: double.infinity,
                  style: AppTextStyles.font14WhiteSemiBold,
                  onTap: () {
                    GoRouter.of(context).push(TeacherQuizzesView.routeName,
                        extra: GetQuizzesRequestQueryParamsModel(
                            courseId: course.id.toString(),
                            quizStatus: "scheduled",
                            fromDate: ""));
                  },
                  icon: SvgPicture.asset(Assets.imagesSvgsTwoCirclesTimeIcon),
                  primaryButton: true),
              vGap(12),
              CustomTextAndIconButton(
                  text: S.of(context).previous_quizzes,
                  width: double.infinity,
                  style: AppTextStyles.font14WhiteSemiBold,
                  onTap: () {
                    GoRouter.of(context).push(TeacherQuizzesView.routeName,
                        extra: GetQuizzesRequestQueryParamsModel(
                            courseId: course.id.toString(),
                            quizStatus: "finished",
                            fromDate: ""));
                  },
                  icon: SvgPicture.asset(Assets.imagesSvgsTimePulseIcon),
                  primaryButton: false),
            ]),
          ),
          vGap(20)
        ],
      ),
    );
  }
}

class CourseQuizSkeleton extends StatelessWidget {
  const CourseQuizSkeleton({super.key});

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
              "اسم مادة افتراضي",
              style: AppTextStyles.font20DarkerBlueBold,
            ),
          ),
          vGap(10),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 15.w),
            child: Text(
              "${S.of(context).registered_students_count} 0",
              style: AppTextStyles.font12GraySemiBold,
            ),
          ),
          vGap(12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(children: [
              Skeleton.leaf(
                child: CustomTextAndIconButton(
                    text: S.of(context).createQuiz,
                    width: double.infinity,
                    style: AppTextStyles.font14WhiteSemiBold,
                    onTap: () {
                      // GoRouter.of(context).push(QrAttendanceView.routeName);
                    },
                    icon: SvgPicture.asset(Assets.imagesSvgsAddIcon),
                    primaryButton: true),
              ),
              vGap(12),
              Skeleton.leaf(
                child: CustomTextAndIconButton(
                    text: S.of(context).scheduled_quizzes,
                    width: double.infinity,
                    style: AppTextStyles.font14WhiteSemiBold,
                    onTap: () {
                      // GoRouter.of(context).push(AddLectureView.routeName
                      //   , extra: courseData.id
                      // );
                    },
                    icon: SvgPicture.asset(Assets.imagesSvgsTwoCirclesTimeIcon),
                    primaryButton: true),
              ),
              vGap(12),
              Skeleton.leaf(
                child: CustomTextAndIconButton(
                    text: S.of(context).previous_quizzes,
                    width: double.infinity,
                    style: AppTextStyles.font14WhiteSemiBold,
                    onTap: () {},
                    icon: SvgPicture.asset(Assets.imagesSvgsTimePulseIcon),
                    primaryButton: false),
              ),
            ]),
          ),
          vGap(20)
        ],
      ),
    );
  }
}
