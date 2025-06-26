import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/features/quizes/logic/quiz_details_cubit/quiz_details_cubit.dart';

import '../../../../core/widgets/custom_scaffold.dart';
import '../widgets/quiz_results_view_body.dart';

class QuizResultsView extends StatelessWidget {
  static const String routeName = "/quiz_results_view";
  const QuizResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    final quizId = GoRouterState.of(context).extra as String;
    return CustomScaffold(
        body: BlocProvider(
      create: (context) => getIt<QuizDetailsCubit>()..fetchQuizDetails(quizId),
      child: const QuizResultsViewBody(),
    ));
  }
}
