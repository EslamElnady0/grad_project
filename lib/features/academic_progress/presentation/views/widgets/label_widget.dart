import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    super.key,
    required this.labels,
    required this.index,
  });

  final List<String> labels;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          gradient: Constants.secondaryGrad,
          borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          labels[index],
          style: AppTextStyles.font12WhiteSemiBold,
        ),
      ),
    );
  }
}
