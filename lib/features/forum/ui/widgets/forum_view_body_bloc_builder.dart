import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/failure_state_widget.dart';
import 'package:grad_project/features/forum/data/models/get_all_questions_response_model.dart';
import 'package:grad_project/features/forum/logic/get_all_questions_cubit/get_all_questions_cubit.dart';
import 'package:grad_project/features/forum/logic/filter_questions_cubit/filter_questions_cubit.dart';
import 'package:grad_project/features/forum/logic/toggle_like_cubit/toggle_like_cubit.dart';
import 'package:grad_project/features/forum/ui/widgets/forum_view_body.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ForumViewBodyBlocBuilder extends StatelessWidget {
  const ForumViewBodyBlocBuilder({super.key});

  Widget _buildFailureState(BuildContext context, String error) {
    return FailureStateWidget(
      errorMessage: error,
      title: S.of(context).filter_questions,
      icon: Icons.forum_outlined,
      onRetry: () {
        context.read<GetAllQuestionsCubit>().getAllQuestions();
        context.read<FilterQuestionsCubit>().resetFilter();
      },
    );
  }

  Widget _buildGetAllQuestionsFailureState(BuildContext context, String error) {
    return FailureStateWidget(
      errorMessage: error,
      title: S.of(context).questions,
      icon: Icons.forum_outlined,
      onRetry: () {
        context.read<GetAllQuestionsCubit>().getAllQuestions();
      },
    );
  }

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
          final cubit = context.read<GetAllQuestionsCubit>();
          
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
                    isLoadingMore: false,
                  ),
                ),
                filterQuestionsSuccess: (data) => ForumViewsBody(
                  questions: data.questions,
                  totalQuestions: data.totalQuestions,
                  isLoadingMore: false, // Filter results don't have loading more state
                ),
                filterQuestionsFailure: (error) => _buildFailureState(context, error),
                orElse: () => getAllQuestionsState.maybeWhen(
                  getAllQuestionsSuccess: (data) => ForumViewsBody(
                    questions: data.questions,
                    totalQuestions: data.totalQuestions,
                    isLoadingMore: cubit.isLoadingMore,
                  ),
                  loadingMoreQuestions: () {
                    // خلال تحميل المزيد، احتفظ بالبيانات الموجودة
                    return getAllQuestionsState.whenOrNull(
                      getAllQuestionsSuccess: (previousData) => ForumViewsBody(
                        questions: previousData.questions,
                        totalQuestions: previousData.totalQuestions,
                        isLoadingMore: true,
                      ),
                    ) ?? ForumViewsBody(
                      questions: cubit.questions, // استخدم البيانات من الـ cubit
                      totalQuestions: null,
                      isLoadingMore: true,
                    );
                  },
                  getAllQuestionsFailure: (error) => _buildGetAllQuestionsFailureState(context, error),
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
                      isLoadingMore: false,
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
