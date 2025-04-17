import 'package:flutter/material.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/academic_progress/presentation/views/widgets/custom_divider.dart';
import 'package:grad_project/features/academic_progress/presentation/views/widgets/degree_widget.dart';
import 'package:grad_project/features/academic_progress/presentation/views/widgets/subject_header_widget.dart';

class DegreesListView extends StatelessWidget {
  const DegreesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      child: Row(
        children: [
          const SubjectHeaderWidget(),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const DegreeWidget();
              },
              separatorBuilder: (context, index) {
                return const CustomDivider();
              },
              itemCount: 6)
        ],
      ),
    );
  }
}
