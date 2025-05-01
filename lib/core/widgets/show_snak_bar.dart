import 'package:flutter/material.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

void showSnakBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          message,
          style: AppTextStyles.font16WhiteSemiBold,
        ),
        backgroundColor: AppColors.darkblue),
  );
}
