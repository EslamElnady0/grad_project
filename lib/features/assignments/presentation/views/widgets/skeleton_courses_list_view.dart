import 'package:flutter/widgets.dart';
import 'package:grad_project/core/data/models/teachers_courses_response.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_manager_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonCoursesListView extends StatelessWidget {
  const SkeletonCoursesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 2,
        itemBuilder: (context, index) => AssignmentManagerItem(
          courseData: CourseResponse(),
        ),
      ),
    );
  }
}