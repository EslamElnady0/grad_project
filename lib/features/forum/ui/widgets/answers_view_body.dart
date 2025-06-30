import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/features/forum/data/models/question_and_answers_response_model.dart';
import 'package:grad_project/features/forum/ui/widgets/custom_answer_item.dart';
import 'package:grad_project/features/forum/ui/widgets/custom_question_forum_item.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/title_text_widget.dart';

class AnswersViewBody extends StatelessWidget {
  const AnswersViewBody({super.key,  this.questionAndAnswerDataModel, this.questionId});
final QuestionAndAnswerDataModel? questionAndAnswerDataModel;
final String? questionId;
  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                CustomAppBar(title: S.of(context).answer),
                vGap(8),
                TitleTextWidget(text: S.of(context).Answers_welcome_message),
                vGap(18),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: CustomQuestionForumItem(
              questionModel: questionAndAnswerDataModel?.question,
              onQuestionDeleted: () {
                // Navigate back when question is deleted
                Navigator.of(context).pop();
              },
            ),
          ),
          vGap(18),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: questionAndAnswerDataModel?.answers?.length ?? 0,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: CustomAnswerItem(
                answerModel: questionAndAnswerDataModel?.answers?[index],
                questionId: questionAndAnswerDataModel?.question?.id,
              ),
            ),
          ),
        ],
      ),
    ); 
  }
}
   