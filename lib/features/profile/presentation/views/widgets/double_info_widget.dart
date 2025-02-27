import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/profile/presentation/views/widgets/info_widget.dart';

class DoubleInfoWidget extends StatelessWidget {
  const DoubleInfoWidget(
      {super.key,
      required this.label1,
      required this.content1,
      required this.label2,
      required this.content2});

  final String label1;
  final String content1;
  final String label2;
  final String content2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: InfoWidget(label: label1, content: content1)),
        hGap(20),
        Expanded(child: InfoWidget(label: label2, content: content2)),
      ],
    );
  }
}
