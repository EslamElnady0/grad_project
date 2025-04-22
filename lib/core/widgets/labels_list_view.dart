import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/widgets/label_widget.dart';

class LabelsListView extends StatelessWidget {
  const LabelsListView({
    super.key,
    required this.labels,
    this.gradient,
    this.color,
    required this.textStyle, required this.width,
  });
  final List<String> labels;
  final LinearGradient? gradient;
  final Color? color;
  final TextStyle textStyle;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      height: 70,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return LabelWidget(
            label: labels[index],
            gradient: gradient,
            color: color,
            textStyle: textStyle,
            width: width,
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
