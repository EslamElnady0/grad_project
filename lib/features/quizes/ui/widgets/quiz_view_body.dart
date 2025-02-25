import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/widgets/svg_icon_button.dart';
import 'package:grad_project/features/quizes/ui/widgets/quiz_label_widget_content.dart';

import 'custom_question_widget.dart';

class QuizViewBody extends StatelessWidget {
  const QuizViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [
          vGap(18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgIconButton(
                  iconPath: Assets.imagesSvgsAlignmentRightIcon,
                  onPressed: () {}),
              const CircleAvatar(
                backgroundImage: AssetImage(Assets.imagesAvatarDoc),
              )
            ],
          ),
          vGap(18),
          QuizLabelWidgetContent(
              trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 7),
            child: SvgIconButton(
                iconPath: Assets.imagesSvgsQuizMenuIcon, onPressed: () {}),
          )),
          vGap(14),
          CustomQuestionWidget()
        ],
      ),
    );
  }
}
