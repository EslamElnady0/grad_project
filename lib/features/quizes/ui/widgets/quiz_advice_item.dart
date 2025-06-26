import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_white_drop_shadowed_container.dart';
import 'package:grad_project/core/widgets/green_grad_container.dart';

class QuizAdviceItem extends StatelessWidget {
  final String value;
  final String title;
  final int index;
  const QuizAdviceItem(
      {super.key,
      required this.value,
      required this.index,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            GreenGradButton(
              height: 44,
              radius: 16,
              onTap: () {},
              title: title,
              style: AppTextStyles.font12WhiteSemiBold,
            ),
            PositionedDirectional(
              start: -11,
              child: CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.backGround,
                child: Text(
                  index.toString(),
                  style: AppTextStyles.font22GreenSemiBold,
                ),
              ),
            )
          ],
        ),
        vGap(8),
        CustomWhiteDropShadowedContainer(
          child: Text(
            value,
            style: AppTextStyles.font12BlackSemiBold,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
