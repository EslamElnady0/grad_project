import 'package:flutter/material.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

class Cell extends StatelessWidget {
  const Cell({
    super.key,
    required this.content,
  });
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: 150,
      child: Center(
        child: Text(
          content,
          style: AppTextStyles.font16BlackSemiBold,
          maxLines: 3,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
