import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/quizes/ui/cubit/quiz_cubit/quiz_cubit.dart';

import '../../logic/student_quiz_answers_cubit/student_quiz_answers_cubit.dart';
import '../models/student_answers_review_navigation.dart';
import '../widgets/students_answers_review_view.dart';

class StudentsAnswersReviewView extends StatelessWidget {
  static const String routeName = "/students_answers_review_view";
  const StudentsAnswersReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final model =
        GoRouterState.of(context).extra as StudentAnswersReviewNavigation;
    return CustomScaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<StudentQuizAnswersCubit>()
              ..fetchStudentQuizAnswers(model.quizId, model.studentId),
          ),
          BlocProvider(
            create: (context) => QuizCubit(),
          ),
        ],
        child: const StudentsAnswersReviewViewBody(),
      ),
    );
  }
}
