import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/academic_progress/presentation/views/widgets/label_widget.dart';

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
      height: 70,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return LabelWidget(labels: labels, index: index);
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
