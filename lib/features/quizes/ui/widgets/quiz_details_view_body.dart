import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/core/widgets/green_grad_container.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/features/quizes/ui/views/quiz_view.dart';
import 'package:grad_project/features/quizes/ui/widgets/quiz_label_widget.dart';
import 'package:grad_project/generated/l10n.dart';

import 'quiz_advices_section.dart';
import 'quiz_desc_section.dart';
import 'quiz_details_section.dart';

class QuizDetailsViewBody extends StatelessWidget {
  const QuizDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInnerScreensAppBar(title: S.of(context).quiz),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TitleTextWidget(text: S.of(context).testYourKnowledge),
                  vGap(10),
                  QuizLabelWidget(),
                  vGap(16),
                  QuizDescSection(),
                  vGap(16),
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: GreenGradButton(
                          title: S.of(context).startNow,
                          onTap: () {
                            GoRouter.of(context).push(QuizView.routeName);
                          })),
                  QuizDetailsSection(),
                  vGap(12),
                  QuizAdvicesSection(),
                  vGap(16),
                  Text(
                    S.of(context).goodLuck,
                    style: AppTextStyles.font16BlackSemiBold,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
