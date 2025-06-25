import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/helpers/spacing.dart';

class CustomReviewMcqChoiceWidget extends StatelessWidget {
  final int index;
  final String choice;
  final bool isStudentAnswer;
  final bool isCorrect;

  const CustomReviewMcqChoiceWidget({
    super.key,
    required this.index,
    required this.choice,
    required this.isStudentAnswer,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(
              color: isCorrect
                  ? Colors.green
                  : isStudentAnswer
                      ? Colors.red
                      : AppColors.darkblue,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          child: isStudentAnswer
              ? Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: isCorrect ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                )
              : isCorrect
                  ? Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    )
                  : const SizedBox.shrink(),
        ),
        hGap(10),
        Expanded(
          child: Text(
            "${Constants.dummyChoices[index]} $choice",
            style: AppTextStyles.font13BlackSemiBold,
            maxLines: 10,
          ),
        ),
      ],
    );
  }
}
