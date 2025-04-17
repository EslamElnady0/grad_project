

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CustomTransparentButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? width;
  const CustomTransparentButton(
      {super.key, required this.onPressed, required this.title, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.darkblue, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: Text(
          title,
          style: AppTextStyles.font16DarkerBlueBold,
        )),
      ),
    );
  }
}
