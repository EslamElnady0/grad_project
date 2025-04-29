import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/data/models/teachers_courses_response.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_manager_item.dart';

class AssignmentManagerItemListView extends StatelessWidget {
  const AssignmentManagerItemListView(
      {super.key, required this.allCoursesResponseModel});

  final TeachersCoursesResponse allCoursesResponseModel;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(bottom: 200.h),
      itemCount: allCoursesResponseModel.data.length,
      itemBuilder: (context, index) {
        return AssignmentManagerItem(
          courseData: allCoursesResponseModel.data[index],
        );
      },
      separatorBuilder: (context, index) => vGap(10),
    );
  }
}
