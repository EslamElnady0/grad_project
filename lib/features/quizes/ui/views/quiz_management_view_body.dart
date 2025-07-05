import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/data/models/teachers_courses_response.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/logic/all_courses_cubit/all_courses_cubit.dart';
import 'package:grad_project/features/quizes/ui/widgets/custom_course_quiz_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/home_screens_header_row.dart';
import '../../../home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/core/widgets/failure_state_widget.dart';

class QuizManagementViewBody extends StatefulWidget {
  const QuizManagementViewBody({super.key});

  @override
  State<QuizManagementViewBody> createState() => _QuizManagementViewBodyState();
}

class _QuizManagementViewBodyState extends State<QuizManagementViewBody> {
  @override
  void initState() {
    context.read<AllCoursesCubit>().get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        vGap(22),
        symmetricPaddingWidget(
          child: HomeScreensHeaderRow(
            onMenuTap: () {
              Scaffold.of(context).openDrawer();
            },
            onSearchTap: () {},
          ),
        ),
        vGap(14),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: symmetricPaddingWidget(
              child: TitleTextWidget(text: S.of(context).quizHelperText)),
        ),
        vGap(14),
        Expanded(
          child: BlocBuilder<AllCoursesCubit, AllCoursesState>(
            builder: (context, state) => state.maybeWhen(
              orElse: () => _buildCoursesLoading(),
              allTeacherCoursesSuccess: (data) => _buildCoursesSuccess(data),
              allCoursesFailure: (error) => _buildFailureState(context, error),
            ),
          ),
        ),
        vGap(80)
      ],
    );
  }

  Widget _buildCoursesSuccess(TeachersCoursesResponse data) {
    return RefreshIndicator(
      color: AppColors.primaryColorlight,
      onRefresh: () => context.read<AllCoursesCubit>().get(),
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: data.data.length,
        separatorBuilder: (context, index) => vGap(16),
        itemBuilder: (context, index) {
          return CustomCourseQuizWidget(course: data.data[index]);
        },
      ),
    );
  }

  Widget _buildCoursesLoading() {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: 3,
        separatorBuilder: (context, index) => vGap(16),
        itemBuilder: (context, index) {
          return const CourseQuizSkeleton();
        },
      ),
    );
  }

  Widget _buildFailureState(BuildContext context, String error) {
    return FailureStateWidget(
      errorMessage: error,
      title: S.of(context).failedToLoadCourses,
      icon: Icons.menu_book_outlined,
      onRetry: () {
        context.read<AllCoursesCubit>().get();
      },
    );
  }
}
