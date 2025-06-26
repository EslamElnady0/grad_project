import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/widgets/svg_icon_button.dart';
import 'package:grad_project/features/quizes/data/models/get_quiz_using_id_response.dart';
import 'package:grad_project/features/quizes/ui/widgets/count_down_timer_widget.dart';
import 'package:grad_project/features/quizes/ui/widgets/finish_quiz_row.dart';
import 'package:grad_project/features/quizes/ui/widgets/quiz_label_widget_content.dart';
import 'package:grad_project/features/quizes/ui/widgets/show_quiz_navigation_pop_up_menu.dart';
import 'package:provider/provider.dart';
import 'custom_question_widget.dart';
import 'quiz_questions_management.dart';

class QuizViewBody extends StatelessWidget {
  const QuizViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    GetQuizByIdResponse data = context.read<GetQuizByIdResponse>();
    GlobalKey actionKey = GlobalKey();
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
              title: data.data.title,
              trailing: Padding(
                padding: const EdgeInsetsDirectional.only(end: 7.0),
                child: SvgIconButton(
                    key: actionKey,
                    iconPath: Assets.imagesSvgsQuizMenuIcon,
                    onPressed: () {
                      showQuizNavigationPopUpMenu(context, actionKey, data);
                    }),
              )),
          vGap(14),
          const CountdownTimerWidget(),
          vGap(14),
          const CustomQuestionWidget(),
          vGap(16),
          QuizQuestionsManagement(
            totalQuestions: data.data.questions.length,
          ),
          vGap(20),
          const FinishQuizRow(),
        ],
      ),
    );
  }
}
