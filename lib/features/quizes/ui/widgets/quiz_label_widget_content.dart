import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/extensions.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

class QuizLabelWidgetContent extends StatelessWidget {
  final String title;
  final Widget? trailing;
  const QuizLabelWidgetContent({super.key, this.trailing, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                gradient: Constants.secondaryGrad,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  Assets.imagesSvgsQuizIcon,
                  width: 25,
                  height: 25,
                ),
              ),
            ),
            hGap(10),
            SizedBox(
              width: context.width * 0.4,
              child: Text(
                title,
                style: AppTextStyles.font16BlackSemiBold,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            hGap(10),
          ],
        ),
        trailing ?? const SizedBox.shrink()
      ],
    );
  }
}
