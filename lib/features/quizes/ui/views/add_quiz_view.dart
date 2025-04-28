import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/quizes/logic/quizzes_cubit/quizzes_cubit.dart';
import 'package:grad_project/features/quizes/ui/widgets/question_list_widget.dart';

import '../../../../core/di/dependency_injection.dart';
import '../cubit/add_quiz_cubit/add_quiz_cubit.dart';
import '../widgets/add_quiz_view_body.dart';

class AddQuizView extends StatelessWidget {
  static const String routeName = '/add-quiz-view';
  const AddQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<AddQuizCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<QuestionListCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<QuizzesCubit>(),
          ),
        ],
        child: const AddQuizViewBody(),
      ),
    );
  }
}
