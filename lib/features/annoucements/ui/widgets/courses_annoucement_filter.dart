import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/widgets/custom_dark_blue_container.dart';
import 'package:grad_project/features/annoucements/logic/get_teacher_cources_cubit/get_teacher_cources_cubit.dart';
import 'package:grad_project/features/annoucements/ui/widgets/courses_filter_item.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/teachers_courses_response.dart';
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
          child: BlocBuilder<GetTeacherCourcesCubit, GetTeacherCourcesState>(
              builder: (context, state) => state.maybeWhen(
                  orElse: () => const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                  getTeacherCourcesLoading: () =>
                      const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                  getTeacherCourcesSuccess: (data) {
                    final responseData = data as TeachersCoursesResponse;
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        List<String> subjects = responseData.data
                            .map((course) => course.name)
                            .toList();
                        final subject = subjects[index];
                        return CoursesFilterItem(
                          title: subject,
                          isSelected: selectedFilters.contains(subject),
                          onTap: () {
                            context
                                .read<AnnouncementFilterCubit>()
                                .toggleFilter(subject);
                          },
                        );
                      },
                      separatorBuilder: (context, index) => hGap(10),
                      itemCount: data.data.length,
                    );
                  })),
        );
      },
    );
  }
}
