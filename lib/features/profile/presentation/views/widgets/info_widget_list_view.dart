import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/profile/presentation/views/widgets/double_info_widget.dart';
import 'package:grad_project/features/profile/presentation/views/widgets/info_widget.dart';

class InfoWidgetListView extends StatelessWidget {
  const InfoWidgetListView({
    super.key,
    required this.labels,
    required this.info,
  });

  final List<String> labels;
  final List<String> info;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          if (index == 3&& index + 1 < labels.length) {
            return Column(
              children: [
                DoubleInfoWidget(
                    label1: labels[index],
                    content1: info[index],
                    label2: labels[index + 1],
                    content2: info[index + 1]),
              vGap(10),],
            );
          } else if (index == 4) {
            return vGap(10);
          } else {
            return Column(
              children: [
                InfoWidget(label: labels[index], content: info[index]),vGap(10),
              ],
            );
          }
        },
        childCount: labels.length),);
  }
}