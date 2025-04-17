import 'package:flutter/material.dart';
import 'package:grad_project/core/theme/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 55,
      child: VerticalDivider(
        thickness: 1,
        color: AppColors.gray,
        width: 17,
      ),
    );
  }
}
