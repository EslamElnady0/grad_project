import 'package:flutter/widgets.dart';
import 'package:grad_project/features/quizes/ui/widgets/title_and_drop_down_widget.dart';
import 'package:grad_project/generated/l10n.dart';

class AssignmentDegreeWidget extends StatelessWidget {
  const AssignmentDegreeWidget(
      {super.key,
      required this.valueText,
      required this.titleText,
      required this.typeLabel,
      required this.contentList,
      required this.onSelected,
     });

  final String valueText;
  final String titleText;
  final String typeLabel;
  final List<int> contentList;
  final Function(int) onSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TitleAndDropDownWidget<int>(
        title: S.of(context).assignment_degree,
        value:
            valueText,
        type: typeLabel,
        contentList: contentList,
        onSelected: (value) {
          onSelected(value);
        },
      ),
    );
  }
}
