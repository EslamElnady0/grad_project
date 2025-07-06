import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/logic/all_courses_cubit/all_courses_cubit.dart';
import 'package:grad_project/core/widgets/failure_state_widget.dart';
import 'package:grad_project/features/subjects/ui/widgets/lecture_manager_item.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/data/models/teachers_courses_response.dart';
import '../../../home/ui/widgets/home_screens_header_row.dart';
import '../../../home/ui/widgets/title_text_widget.dart';

class LectureManagerViewBody extends StatelessWidget {
  const LectureManagerViewBody({super.key});

  Widget _buildFailureState(BuildContext context, String error) {
    return FailureStateWidget(
      errorMessage: error,
      title: S.of(context).failedToLoadCourses,
      icon: Icons.school_outlined,
      onRetry: () {
        context.read<AllCoursesCubit>().get();
      },
    );
  }

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
              text: S.of(context).full_control_over_courses,
            ),
          ),
          vGap(12),
          BlocConsumer<AllCoursesCubit, AllCoursesState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is AllTeacherCoursesSuccess) {
                final allCoursesResponseModel = state.data;
                return _buildCourseList(allCoursesResponseModel);
              } else if (state is AllCoursesFailure) {
                return _buildFailureState(context, state.error);
              } else {
                return _buildSkeletonList();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCourseList(TeachersCoursesResponse allCoursesResponseModel) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 200.h),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: allCoursesResponseModel.data.length,
      itemBuilder: (context, index) {
        return LectureManagerItem(
          courseData: allCoursesResponseModel.data[index],
        );
      },
    );
  }

  Widget _buildSkeletonList() {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 2,
        itemBuilder: (context, index) => LectureManagerItem(
          courseData: CourseResponse(), // عرض بيانات فارغة
        ),
      ),
    );
  }
}
