import 'package:flutter/material.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

class TitleTextWidget extends StatelessWidget {
  final String text;
  const TitleTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.font10greenMedium.copyWith(color: AppColors.gray),
      textAlign: TextAlign.center,
    );
  }
}
