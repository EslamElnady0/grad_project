import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/localizationa.dart';
import 'package:grad_project/features/lecture_manager/ui/widgets/lecture_form_content.dart'show LectureFormContent;
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_expansion_tile.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/title_text_widget.dart';

class AddLectureViewBody extends StatefulWidget {
  const AddLectureViewBody({super.key});

  @override
  State<AddLectureViewBody> createState() => _AddLectureViewBodyState();
}

class _AddLectureViewBodyState extends State<AddLectureViewBody> {
  final Map<String, bool> expandedMap = {};

  @override
  void initState() {
    super.initState();
    // Initialize for week1 to week9
    for (int i = 1; i <= 14; i++) {
      expandedMap["week$i"] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: S.of(context).addStudyContent),
          vGap(8),
          TitleTextWidget(text: S.of(context).addStudyContentSubtitle),
          vGap(16),

          // Display weeks 1 to 9
          ...List.generate(14, (index) {
            final weekKey = "week${index + 1}";
            final isExpanded = expandedMap[weekKey] ?? false;
            final title = isArabicLocale(context)
                ? Constants.weakEn[weekKey]!
                : Constants.weakAr[weekKey]!;

            return CustomExpansionTile(
              day: title,
              isExpanded: isExpanded,
              onExpansionChanged: (expanded) {
                setState(() {
                  expandedMap[weekKey] = expanded;
                });
              },
              children: const [
                LectureFormContent(),
              ],
            );
          }),
        ],
      ),
    );
  }
}
