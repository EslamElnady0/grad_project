import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/logic/all_courses_cubit/all_courses_cubit.dart';
import 'package:grad_project/core/widgets/custom_dark_blue_container.dart';
import 'package:grad_project/core/data/models/students_courses_response.dart';
import 'package:grad_project/features/annoucements/ui/widgets/courses_filter_item.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/data/models/teachers_courses_response.dart';
import '../ui cubit/announcement_filter_cubit.dart';

class CoursesAnnoucementFilter extends StatelessWidget {
  const CoursesAnnoucementFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementFilterCubit, Set<String>>(
      builder: (context, selectedFilters) {
        return CustomDarkBlueContainer(
          height: 55.h,
          foregroundDecoration: const BoxDecoration(),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: BlocBuilder<AllCoursesCubit, AllCoursesState>(
            builder: (context, state) => state.maybeWhen(
              orElse: () => _buildSkeletonLoading(
                highlightColor: const Color.fromARGB(255, 209, 208, 208),
              ),
              allCoursesLoading: () => _buildSkeletonLoading(
                highlightColor: const Color.fromARGB(255, 209, 208, 208),
              ),
              allTeacherCoursesSuccess: (data) =>
                  _buildTeacherCoursesList(context, data, selectedFilters),
              allStudentCoursesSuccess: (data) =>
                  _buildStudentCoursesList(context, data, selectedFilters),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSkeletonLoading({Color? highlightColor}) {
    return Skeletonizer(
      enabled: true,
      effect: highlightColor != null
          ? ShimmerEffect(highlightColor: highlightColor)
          : null,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => const SkeletonCourseItem(),
        separatorBuilder: (context, index) => hGap(10),
        itemCount: 3,
      ),
    );
  }

  Widget _buildTeacherCoursesList(BuildContext context,
      TeachersCoursesResponse data, Set<String> selectedFilters) {
    final subjects = data.data.map((course) => course.name).toList();
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final subject = subjects[index];
        return CoursesFilterItem(
          title: subject!,
          isSelected: selectedFilters.contains(subject),
          onTap: () {
            context.read<AnnouncementFilterCubit>().toggleFilter(subject);
          },
        );
      },
      separatorBuilder: (context, index) => hGap(10),
      itemCount: subjects.length,
    );
  }
}

Widget _buildStudentCoursesList(BuildContext context,
    StudentsCoursesResponse data, Set<String> selectedFilters) {
  final subjects = data.data.map((course) => course.name).toList();
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    itemBuilder: (context, index) {
      final subject = subjects[index];
      return CoursesFilterItem(
        title: subject,
        isSelected: selectedFilters.contains(subject),
        onTap: () {
          context.read<AnnouncementFilterCubit>().toggleFilter(subject);
        },
      );
    },
    separatorBuilder: (context, index) => hGap(10),
    itemCount: subjects.length,
  );
}
