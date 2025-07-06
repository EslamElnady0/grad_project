import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/logic/all_courses_cubit/all_courses_cubit.dart';
import 'package:grad_project/core/widgets/failure_state_widget.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_manager_item_list_view.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/skeleton_courses_list_view.dart';
import 'package:grad_project/features/home/ui/widgets/home_screens_header_row.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/generated/l10n.dart';

class AssignmentsHomeBody extends StatelessWidget {
  const AssignmentsHomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          vGap(22),
          HomeScreensHeaderRow(
            onMenuTap: () {
              Scaffold.of(context).openDrawer();
            },
            onSearchTap: () {},
          ),
          vGap(14),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child:
                TitleTextWidget(text: S.of(context).assignments_home_message),
          ),
          vGap(12),
          BlocConsumer<AllCoursesCubit, AllCoursesState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is AllTeacherCoursesSuccess) {
                final allCoursesResponseModel = state.data;
                return Expanded(
                  child: AssignmentManagerItemListView(
                    allCoursesResponseModel: allCoursesResponseModel,
                  ),
                );
              }
              if (state is AllCoursesFailure) {
                return _buildFailureState(context, state.error);
              } else {
                return const Expanded(child: SkeletonCoursesListView());
              }
            },
          ),
        ],
      ),
    );
  }
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
