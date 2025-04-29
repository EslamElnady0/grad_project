import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/data/models/students_courses_response.dart';
import 'package:grad_project/core/logic/all_courses_cubit/all_courses_cubit.dart';

import 'package:grad_project/features/subjects/ui/widgets/custom_subject_card.dart';
import 'package:grad_project/features/subjects/ui/widgets/custom_subjects_filter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/data/models/all_courses_response_model.dart';
import '../../../../core/helpers/spacing.dart';

import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/home_screens_header_row.dart';
import '../../../home/ui/widgets/title_text_widget.dart';

class SubjectsViewBody extends StatelessWidget {
  const SubjectsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
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
            ],
          )),
          const SliverToBoxAdapter(
            child: CustomSupjectsFilter(),
          ),
          BlocBuilder<AllCoursesCubit, AllCoursesState>(
            builder: (context, state) {
              print("state is $state");
             if (state is AllStudentCoursesSuccess) {
              print("state is=========== ${state.data}");
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
    return SliverList.builder(
      itemCount: allCoursesResponseModel.data.length,
      itemBuilder: (context, index) {
        return CustomSubjectCard(
          courseData: allCoursesResponseModel.data[index],
        );
      },
    );
  }
  Widget _buildSkeletonList() {
    return const SliverToBoxAdapter(
      child: Column(
        children: [
      
          Skeletonizer(  
            enabled: true,
            child:CustomSubjectCard(
          courseData:null, 
        )
          ),
          Skeletonizer(  
            enabled: true,
            child:CustomSubjectCard(
          courseData: null ,
        )
          ),
    
        ],
      ), 
    );
  }
}
 