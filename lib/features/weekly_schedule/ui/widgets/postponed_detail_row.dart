import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

class PostponedDetailRow extends StatelessWidget {
  const PostponedDetailRow({
    super.key,
    required this.context,
    required this.label,
    required this.value,
  });

  final BuildContext context;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: AppTextStyles.font12GrayMedium,
            ),
          ),
          hGap(12),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: AppTextStyles.font12BlackMedium,
            ),
          ),
        ],
      ),
    );
  }
}
