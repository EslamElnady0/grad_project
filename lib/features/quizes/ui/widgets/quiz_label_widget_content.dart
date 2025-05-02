import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:provider/provider.dart';
import '../../data/models/get_quizzes_response.dart';

class QuizLabelWidgetContent extends StatelessWidget {
  final Widget trailing;
  const QuizLabelWidgetContent({super.key, required this.trailing});

  @override
  Widget build(BuildContext context) {
    final quizModel = context.read<QuizModel>();

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quizModel.title,
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                vGap(5),
                Text(
                  //TO BE ADJUSTED
                  quizModel.course.name,
                  style: AppTextStyles.font10GraySemiBold,
                ),
              ],
            ),
          ],
        ),
        trailing
      ],
    );
  }
}
