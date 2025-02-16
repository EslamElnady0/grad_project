import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.font16BlackMedium,
              ),
            ),
            SizedBox(width: 35),
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
