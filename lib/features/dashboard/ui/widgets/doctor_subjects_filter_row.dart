import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/logic/all_courses_cubit/all_courses_cubit.dart';
import 'package:grad_project/features/dashboard/ui/cubit/get_dashboard_courses_cubit.dart';
import 'package:grad_project/features/dashboard/ui/widgets/custom_toggle_title_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/data/models/teachers_courses_response.dart';

class DoctorSubjectsFilterRow extends StatelessWidget {
  const DoctorSubjectsFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCoursesCubit, AllCoursesState>(
        builder: (context, state) => state.maybeWhen(
            orElse: () => _buildLoadingState(
                  highlightColor: const Color.fromARGB(255, 209, 208, 208),
                ),
            allTeacherCoursesSuccess: (data) => _buildSuccessState(data)));
  }

  Widget _buildSuccessState(TeachersCoursesResponse data) {
    return BlocBuilder<GetDashboardCoursesCubit, Set<String>>(
      builder: (context, state) {
        List<String> availableSemestersList =
            data.data.map((e) => e.semester!.name!).toList();
        Set<String> availableSemestersSet = availableSemestersList.toSet();

        return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 12.w,
              children: List.generate(availableSemestersSet.length, (index) {
                return CustomToggleButton(
                  title: availableSemestersSet.toList()[index],
                  isSelected:
                      state.contains(availableSemestersSet.toList()[index]),
                  onTap: () {
                    context
                        .read<GetDashboardCoursesCubit>()
                        .toggleFilter(availableSemestersSet.toList()[index]);
                  },
                );
              }),
            ));
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
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 12.w,
            children: List.generate(3, (index) {
              return const CustomSkeletonContainer();
            }),
          ),
        ));
  }
}
