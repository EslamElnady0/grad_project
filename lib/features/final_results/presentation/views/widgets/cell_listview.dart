import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/final_results/presentation/views/widgets/cell.dart';
import 'package:grad_project/features/final_results/presentation/views/widgets/course_status.dart';

class CourseCellListView extends StatelessWidget {
  const CourseCellListView({
    super.key,
    required this.course,
  });

  final List<String> course;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: course.length,
            separatorBuilder: (context, index) => hGap(5),
            itemBuilder: (context, index) {
              if (index < 3) {
                return Cell(content: course[index]);
              } else {
                return CourseStatus(content: course[index]);
              }
            },
          ),
        ],
      ),
    );
  }
}
