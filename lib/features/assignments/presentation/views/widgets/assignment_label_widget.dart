import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/assignments/data/models/get_assignments_response_model.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_label_widget_content.dart';
import 'package:grad_project/generated/l10n.dart';

class AssignmentLabelWidget extends StatelessWidget {
  const AssignmentLabelWidget({super.key, required this.assignmentModel});

  final AssignmentModel assignmentModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: AssignmentLabelWidgetContent(
        title: assignmentModel.title,
        trailing: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Colors.black,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            assignmentModel.status == 'finished'
                ? S.of(context).done
                : S.of(context).scheduled,
            style: AppTextStyles.font10BlackMedium,
          ),
        ),
      ),
    );
  }
}
