import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../theme/app_text_styles.dart';


class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Widget icon;
  const CustomOutlinedButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.blackLight, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        backgroundColor: Colors.transparent,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          hGap(8),
          Text(
            title,
            style: AppTextStyles.font17WhiteSemiBold.copyWith(
              color: AppColors.blackLight, 
            ),
          ),
        ],
      ),
    );
  }
}
