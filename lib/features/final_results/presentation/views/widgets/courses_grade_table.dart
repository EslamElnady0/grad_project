import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/labels_list_view.dart';
import 'package:grad_project/features/final_results/presentation/views/widgets/cell_listview.dart';
import 'package:grad_project/generated/l10n.dart';

class CoursesGradesTable extends StatelessWidget {
  const CoursesGradesTable({
    super.key,
  });

  final List<List<String>> dummyCourses = const [
    ["OOP", "CS203", "C+", "ناجح"],
    ["Data Structures Structures Structures", "CS202", "B", "ناجح"],
    ["Discrete Math", "MA201", "D", "راسب"],
    ["Networks", "CS301", "A", "ناجح"],
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        child: Column(
          children: [
            LabelsListView(
              labels: [
                S.of(context).course_name,
                S.of(context).course_code,
                S.of(context).grade,
                S.of(context).course_status
              ],
              textStyle: AppTextStyles.font14WhiteSemiBold,
              color: AppColors.darkerBlue,
              width: 140,
            ),
            vGap(10),
            Column(
              children: dummyCourses
                  .map(
                    (course) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CourseCellListView(course: course),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
