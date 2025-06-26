import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

class CourseStatus extends StatelessWidget {
  const CourseStatus({super.key, required this.content});

  final String content;
  @override
  Widget build(BuildContext context) {
    final isPass = content == "ناجح";
    return Container(
      width: 140,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        gradient: isPass ? Constants.primaryGrad : Constants.secondaryGrad,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          content,
          style: AppTextStyles.font14WhiteSemiBold,
        ),
      ),
    );
  }
}
