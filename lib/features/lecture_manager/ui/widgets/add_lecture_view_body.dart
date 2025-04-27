import 'package:flutter/material.dart';
import 'package:grad_project/features/lecture_manager/ui/widgets/lecture_form_content.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/title_text_widget.dart';


class AddLectureViewBody extends StatelessWidget {
  const AddLectureViewBody({super.key});

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
          const LectureFormContent(),
        ],
      ),
    );
  }
}
