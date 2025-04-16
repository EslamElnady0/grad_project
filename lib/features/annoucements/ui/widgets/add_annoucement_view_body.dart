import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/annoucements/ui/widgets/display_and_drop_down_button.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';

import '../../../../core/widgets/custom_inner_screens_app_bar.dart';
import '../../../../generated/l10n.dart';
import 'custom_title_and_text_field.dart';

class AddAnnoucementViewBody extends StatelessWidget {
  const AddAnnoucementViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          children: [
            CustomInnerScreensAppBar(title: S.of(context).add_new),
            TitleTextWidget(text: S.of(context).add_new_news),
            vGap(8),
            CustomTitleAndTextField(
              title: S.of(context).news_title,
              hintText: S.of(context).news_title_description,
            ),
            vGap(12),
            CustomTitleAndTextField(
              title: S.of(context).news_content,
              hintText: S.of(context).news_content_description,
              alignLabelWithHint: true,
              maxLines: 5,
            ),
            vGap(12),
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}
