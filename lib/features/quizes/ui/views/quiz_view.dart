import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/quizes/ui/cubit/quiz_cubit/quiz_cubit.dart';

import '../widgets/quiz_view_body.dart';

class QuizView extends StatelessWidget {
  static const String routeName = '/quiz-view';
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    final int quizId = GoRouterState.of(context).extra as int;
    return CustomScaffold(
      body: BlocProvider(
        create: (context) => QuizCubit(),
        child: const QuizViewBody(),
      ),
    );
  }
}
