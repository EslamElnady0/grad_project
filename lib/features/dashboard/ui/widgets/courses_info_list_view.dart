import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/logic/all_courses_cubit/all_courses_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/spacing.dart';
import 'custom_dashboard_course_container.dart';

class CoursesInfoListView extends StatelessWidget {
  const CoursesInfoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCoursesCubit, AllCoursesState>(
      builder: (context, state) => state.maybeWhen(
        orElse: () => _buildLoadingState(),
        allTeacherCoursesSuccess: (data) => ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return CustomDashboardCourseContainer(
              course: data.data[index],
            );
          },
          separatorBuilder: (context, index) => vGap(12),
          itemCount: data.data.length,
        ),
      ),
    );
  }
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
