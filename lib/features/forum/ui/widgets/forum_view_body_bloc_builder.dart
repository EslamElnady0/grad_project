import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/features/forum/data/models/get_all_questions_response_model.dart';
import 'package:grad_project/features/forum/logic/get_all_questions_cubit/get_all_questions_cubit.dart';
import 'package:grad_project/features/forum/logic/filter_questions_cubit/filter_questions_cubit.dart';
import 'package:grad_project/features/forum/logic/toggle_like_cubit/toggle_like_cubit.dart';
import 'package:grad_project/features/forum/ui/widgets/forum_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ForumViewBodyBlocBuilder extends StatelessWidget {
  const ForumViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<GetAllQuestionsCubit>()..getAllQuestions(),
        ),
        BlocProvider(
          create: (context) => getIt<FilterQuestionsCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ToggleLikeCubit>(),
        ),
      ],
      child: BlocBuilder<GetAllQuestionsCubit, GetAllQuestionsState>(
        builder: (context, getAllQuestionsState) {
          return BlocBuilder<FilterQuestionsCubit, FilterQuestionsState>(
            builder: (context, filterQuestionsState) {
              // Determine which state to use - filtered results take priority
              return filterQuestionsState.maybeWhen(
                filterQuestionsLoading: () => const Skeletonizer(
                  enabled: true,
                  child: ForumViewsBody(
                    questions: [
                      QuestionModel(),
                      QuestionModel(),
                      QuestionModel(),
                      QuestionModel(),
                    ],
                    totalQuestions: 0,
                  ),
                ),
                filterQuestionsSuccess: (data) => ForumViewsBody(
                  questions: data.questions,
                  totalQuestions: data.totalQuestions,
                  
                ),
                filterQuestionsFailure: (error) => Center(child: Text(error)),
                orElse: () => getAllQuestionsState.maybeWhen(
                  getAllQuestionsSuccess: (data) => ForumViewsBody(
                    questions: data.questions,
                    totalQuestions: data.totalQuestions,
                  ),
                  getAllQuestionsFailure: (error) => Center(child: Text(error)),
                  orElse: () => const Skeletonizer(
                    enabled: true,
                    child: ForumViewsBody(
                      questions: [
                        QuestionModel(),
                        QuestionModel(),
                        QuestionModel(),
                        QuestionModel(),
                      ],
                      totalQuestions: 0,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
