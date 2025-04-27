import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/quizes/ui/widgets/title_and_drop_down_widget.dart';

class AddQuizDropDowns extends StatelessWidget {
  const AddQuizDropDowns({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => Expanded(
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: TitleAndDropDownWidget<String>(
                  title: "asdasd",
                  value: "dasdf",
                  contentList: const [],
                  onSelected: (value) {
                    setState(() {});
                  },
                ),
              ),
              hGap(16),
              Expanded(
                child: TitleAndDropDownWidget<String>(
                  title: "asdasd",
                  value: "dasdf",
                  contentList: const [],
                  onSelected: (value) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          vGap(12),
          Row(
            children: [
              Expanded(
                child: TitleAndDropDownWidget<String>(
                  title: "asdasd",
                  value: "dasdf",
                  contentList: const [],
                  onSelected: (value) {
                    setState(() {});
                  },
                ),
              ),
              hGap(16),
              Expanded(
                child: TitleAndDropDownWidget<String>(
                  title: "asdasd",
                  value: "dasdf",
                  contentList: const [],
                  onSelected: (value) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
