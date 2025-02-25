import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

import '../../../../core/theme/app_colors.dart';

class CustomMcqChoiceWidget extends StatelessWidget {
  final bool isSelected;
  final int index;
  final VoidCallback onTap;
  final String choice;
  const CustomMcqChoiceWidget(
      {super.key,
      required this.isSelected,
      required this.index,
      required this.onTap,
      required this.choice});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 20,
            width: 20,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.darkblue, width: 2),
                borderRadius: BorderRadius.circular(7)),
            child: isSelected
                ? Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        color: AppColors.darkblue,
                        border: Border.all(color: AppColors.darkblue, width: 2),
                        borderRadius: BorderRadius.circular(4)),
                  )
                : const SizedBox.shrink(),
          ),
        ),
        hGap(10),
        Expanded(
          child: Text(
            "${Constants.dummyChoices[index]} ${Constants.dummyAnswers[index]}",
            style: AppTextStyles.font13BlackSemiBold,
            maxLines: 10,
          ),
        ),
      ],
    );
  }
}
