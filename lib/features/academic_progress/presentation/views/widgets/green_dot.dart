import 'package:flutter/material.dart';
import 'package:grad_project/core/theme/app_colors.dart';

class GreenDot extends StatelessWidget {
  const GreenDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(
          colors: [AppColors.primaryColordark, AppColors.primaryColorlight],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}