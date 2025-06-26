import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/data/models/students_courses_response.dart';
import 'package:grad_project/core/logic/all_courses_cubit/all_courses_cubit.dart';
import 'package:grad_project/features/subjects/ui/widgets/custom_subject_card.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/spacing.dart';

import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/home_screens_header_row.dart';
import '../../../home/ui/widgets/title_text_widget.dart';

class SubjectsViewBody extends StatelessWidget {
  const SubjectsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        children: [
          vGap(22),
          HomeScreensHeaderRow(
            onMenuTap: () {
              Scaffold.of(context).openDrawer();
            },
            onSearchTap: () {},
          ),
          vGap(12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TitleTextWidget(
              text: S.of(context).select_subjects,
            ),
          ),
          vGap(12),
          BlocBuilder<AllCoursesCubit, AllCoursesState>(
            builder: (context, state) {
              if (state is AllStudentCoursesSuccess) {
                final allCourses = state.data;

                return _buildCourseList(allCourses);
              } else {
                return _buildSkeletonList();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCourseList(StudentsCoursesResponse allCoursesResponseModel) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 200.h),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: allCoursesResponseModel.data.length,
      itemBuilder: (context, index) {
        return CustomSubjectCard(
          courseData: allCoursesResponseModel.data[index],
        );
      },
    );
  }

  Widget _buildSkeletonList() {
    return const Column(
      children: [
        Skeletonizer(
            enabled: true,
            child: CustomSubjectCard(
              courseData: null,
            )),
        Skeletonizer(
            enabled: true,
            child: CustomSubjectCard(
              courseData: null,
            )),
      ],
    );
  }
}
