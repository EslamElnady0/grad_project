import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

class LabelsListView extends StatelessWidget {
  const LabelsListView({
    super.key,
    required this.labels,
  });
  final List<String> labels;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      height: 60,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                gradient: Constants.secondaryGrad,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  labels[index],
                  style: AppTextStyles.font14WhiteSemiBold,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return hGap(15);
        },
        itemCount: labels.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
