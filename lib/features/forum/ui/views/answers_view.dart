import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/chat/ui/cubit/file_picker_cubit.dart';
import 'package:grad_project/features/forum/data/models/question_and_answers_response_model.dart';
import 'package:grad_project/features/forum/logic/add_answer/add_answer_cubit.dart';
import 'package:grad_project/features/forum/logic/question_and_answers/question_and_answers_cubit.dart';
import 'package:grad_project/features/forum/logic/toggle_like_cubit/toggle_like_cubit.dart';
import 'package:grad_project/features/forum/ui/widgets/answers_view_body.dart';
import 'package:grad_project/generated/l10n.dart';
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
        ),
        BlocProvider(
          create: (context) => getIt<AddAnswerCubit>(),
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
                )),
                    questionId: questionId),
              ),
              success: (data) {
                return AnswersViewBody(
                  questionAndAnswerDataModel: data.data,
                  questionId: questionId,
                );
              },
              failure: (error) {
                return Center(child: Text(error));
              },
            );
          },
        ),
        bottomNavigationBar: BlocProvider(
          create: (context) => FilePickerCubit(),
          child: BlocConsumer<AddAnswerCubit, AddAnswerState>(
            listener: (context, state) {
              if (state is AddAnswerSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(  
                  SnackBar(
                      content: Text(
                       S.of(context).answerSubmittedSuccessfully,
                       style: AppTextStyles.font12WhiteSemiBold,
                        )),
                );
                // Refresh the question and answers
                context
                    .read<QuestionAndAnswersCubit>()
                    .getQuestionAndAnswers(questionId);
              } else if (state is AddAnswerFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: ${state.error}')),
                );
              }
            },
            builder: (context, addAnswerState) {
              return Stack(
                children: [
                  TextEntryFooter(
                    onSend: (text, files) async {
                      if (text.trim().isNotEmpty) {
                        String? fullBase64;

                        if (files.isNotEmpty) {
                          try {
                            File imageFile = File(files.first.path);
                            List<int> imageBytes =
                                await imageFile.readAsBytes();
                            String base64Image = base64Encode(imageBytes);

                            // لو عايز تضيف header base64 image type
                            fullBase64 = 'data:image/png;base64,$base64Image';
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Error processing image: $e')),
                            );
                            return;
                          }
                        }

                        context.read<AddAnswerCubit>().addAnswer(
                              questionId: questionId,
                              body: text,
                              image:
                                  fullBase64, 
                            );
                      }else {
                            ScaffoldMessenger.of(context).showSnackBar(  
                  SnackBar(
                      content: Text(
                      S.of(context).pleaseEnterYourAnswer,
                       style: AppTextStyles.font12WhiteSemiBold,
                        )),
                );
                      }
                    },
                    onTextChanged: (text) {
                      // Handle text changes if needed
                    },
                  ),
                  if (addAnswerState is AddAnswerLoading)
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.3),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
