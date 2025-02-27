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
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (index == 3 && index + 1 < labels.length) {
          return Column(
            children: [
              DoubleInfoWidget(
                  label1: labels[index],
                  content1: info[index],
                  label2: labels[index + 1],
                  content2: info[index + 1]),
            ],
          );
        } else if (index == 4) {
          return const SizedBox.shrink();
        } else {
          return InfoWidget(label: labels[index], content: info[index]);
        }
      },
      itemCount: labels.length,
      separatorBuilder: (BuildContext context, int index) {
        if (index == 3) return const SizedBox.shrink();
        return vGap(10);
      },
    );
  }
}
