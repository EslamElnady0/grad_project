import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/quizes/ui/cubit/quiz_cubit/quiz_cubit.dart';
import 'package:grad_project/features/quizes/ui/cubit/quiz_navigation_cubit/quiz_question_navigation_cubit.dart';
import 'package:provider/provider.dart';
import '../../data/models/get_quiz_using_id_response.dart';
import '../widgets/quiz_view_body.dart';

class QuizView extends StatelessWidget {
  static const String routeName = '/quiz-view';
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    GetQuizByIdResponse data =
        GoRouterState.of(context).extra as GetQuizByIdResponse;
    return CustomScaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => QuizCubit(),
          ),
          BlocProvider(
            create: (context) => QuizQuestionNavigatorCubit(),
          ),
        ],
        child: Provider.value(value: data, child: const QuizViewBody()),
      ),
    );
  }
}
