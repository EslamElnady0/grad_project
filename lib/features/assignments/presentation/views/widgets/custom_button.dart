import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/assignments/data/models/get_assignments_response_model.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.assignmentModel,
    required this.onTap,
    required this.text,
  });

  final AssignmentModel assignmentModel;
  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: Constants.secondaryGrad,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Center(
            child: Text(text, style: AppTextStyles.font16WhiteSemiBold),
          ),
        ),
      ),
    );
  }
}