import 'package:flutter/material.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

class DegreeWidget extends StatelessWidget {
  const DegreeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      width: 90,
      child: Center(
        child: Text(
          "8/10",
          style: AppTextStyles.font16BlackSemiBold,
        ),
      ),
    );
  }
}
