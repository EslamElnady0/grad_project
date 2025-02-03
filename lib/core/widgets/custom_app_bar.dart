import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(
              flex: 3,
            ),
            Text("تاكيد الأمان!",
                textDirection: TextDirection.rtl,
                style: AppTextStyles.font16BlackMedium),
            Spacer(
              flex: 2,
            ),
            IconButton(
              icon: const Icon(
                Icons.arrow_forward,
                color: AppColors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        Divider(
          color: AppColors.gray,
          thickness: 1,
          height: 0,
        ),
      ],
    );
  }
}
