import 'package:flutter/widgets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/annoucements/ui/widgets/display_and_drop_down_button.dart';
import '../../../../generated/l10n.dart';

class DropDownAndDisplays extends StatelessWidget {
  const DropDownAndDisplays({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DisplayAndDropDownButton(
          title: S.of(context).study_level,
          value: "الفرقة الثانية",
        ),
        hGap(16),
        DisplayAndDropDownButton(
          title: S.of(context).subject,
          value: "Data Structures",
        ),
      ],
    );
  }
}
