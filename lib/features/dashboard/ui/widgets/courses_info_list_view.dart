import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/logic/all_courses_cubit/all_courses_cubit.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/dashboard/ui/cubit/get_dashboard_courses_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/data/models/teachers_courses_response.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/failure_state_widget.dart';
import '../../../../generated/l10n.dart';
import 'custom_dashboard_course_container.dart';

class CoursesInfoListView extends StatelessWidget {
  const CoursesInfoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCoursesCubit, AllCoursesState>(
      builder: (context, state) => state.maybeWhen(
        orElse: () => _buildLoadingState(),
        allTeacherCoursesSuccess: (data) => _buildSuccessState(data),
        allCoursesFailure: (error) => _buildFailureState(context, error),
      ),
    );
  }
}

Widget _buildSuccessState(TeachersCoursesResponse data) {
  return BlocBuilder<GetDashboardCoursesCubit, Set<String>>(
    builder: (context, state) {
      final items = data.data;
      final filteredItems = items.where((course) {
        final subject = course.semester!.name!.toLowerCase();
        return state.isEmpty ||
            state.any((filter) => subject.contains(filter.toLowerCase()));
      }).toList();
      return RefreshIndicator(
        color: AppColors.primaryColordark,
        onRefresh: () async {
          context.read<AllCoursesCubit>().get();
        },
        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return CustomDashboardCourseContainer(
              course: filteredItems[index],
            );
          },
          separatorBuilder: (context, index) => vGap(12),
          itemCount: filteredItems.length,
        ),
      );
    },
  );
}

Widget _buildLoadingState({Color? highlightColor}) {
  return Skeletonizer(
      enabled: true,
      effect: highlightColor != null
          ? ShimmerEffect(highlightColor: highlightColor)
          : null,
      child: SingleChildScrollView(
        child: Column(
          spacing: 12.w,
          children: List.generate(3, (index) {
            return const CustomDashboardCourseContainerSkeleton();
          }),
        ),
      ));
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
