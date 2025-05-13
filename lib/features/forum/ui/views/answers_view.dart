import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/forum/data/models/question_and_answers_response_model.dart';
import 'package:grad_project/features/forum/logic/question_and_answers/question_and_answers_cubit.dart';
import 'package:grad_project/features/forum/logic/toggle_like_cubit/toggle_like_cubit.dart';
import 'package:grad_project/features/forum/ui/widgets/answers_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/widgets/text entry footer/text_entry_footer.dart';

class AnswersView extends StatelessWidget {
  const AnswersView({super.key, required this.questionId});
  final String questionId;
  static const routeName = '/answers-view';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
            value: getIt<QuestionAndAnswersCubit>()
              ..getQuestionAndAnswers(questionId)),
        BlocProvider(
          create: (context) => getIt<ToggleLikeCubit>(),
        )
      ],
      child: CustomScaffold(
        body: BlocBuilder<QuestionAndAnswersCubit, QuestionAndAnswersState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => Skeletonizer(
                enabled: true,
                child: AnswersViewBody(
                    questionAndAnswerDataModel: QuestionAndAnswerDataModel(
                        answers: List.generate(
                  10,
                  (index) => AnswerModel(),
                ))),
              ),
              success: (data) {
                return AnswersViewBody(
                  questionAndAnswerDataModel: data.data,
                );
              },
              failure: (error) {
                return Center(child: Text(error));
              },
            );
          },
        ),
        bottomNavigationBar: ChatViewFooter(
  onSend: (text) {
    print('Send this message: $text');
  },
  onTextChanged: (text) {
    print('Typing: $text');
  },
  onAttach: () {
    print('Open attachments dialog');
  },
),
      ),
    );
  }
}
