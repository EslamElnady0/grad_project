import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/core/widgets/green_grad_container.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/features/quizes/logic/start_students_quiz_cubit/start_students_quiz_cubit.dart';
import 'package:grad_project/features/quizes/ui/widgets/quiz_label_widget.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'quiz_advices_section.dart';
import 'quiz_desc_section.dart';
import 'quiz_details_section.dart';
import '../../data/models/get_quizzes_response.dart';

class QuizDetailsViewBody extends StatelessWidget {
  const QuizDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    QuizModel quizModel = context.read<QuizModel>();
    bool isStarted = quizModel.status == 'started';
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
                  const QuizLabelWidget(),
                  vGap(16),
                  const QuizDescSection(),
                  vGap(16),
                  FlavorsFunctions.isStudent()
                      ? Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Opacity(
                            opacity: isStarted ? 1 : 0.5,
                            child: GreenGradButton(
                                title: S.of(context).startNow,
                                onTap: () {
                                  context
                                      .read<StartStudentsQuizCubit>()
                                      .startStudentsQuiz(
                                          quizModel.id.toString());
                                  // // isStarted
                                  // //     ?
                                  // GoRouter.of(context).push(QuizView.routeName,
                                  //     extra: quizModel.id);
                                  // // : showErrorDialog(
                                  // //     context, S.of(context).quizNotStarted,
                                  // //     translate: false);
                                }),
                          ))
                      : const SizedBox.shrink(),
                  const QuizDetailsSection(),
                  vGap(12),
                  const QuizAdvicesSection(),
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
