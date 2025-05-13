import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_modal_progress.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/quizes/data/models/get_quiz_using_id_response.dart'
    as quiz;
import 'package:grad_project/features/quizes/logic/start_students_quiz_cubit/start_students_quiz_cubit.dart';
import 'package:grad_project/features/quizes/ui/views/quiz_view.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/show_error_dialog.dart';
import '../../data/models/get_quizzes_response.dart';
import '../widgets/quiz_details_view_body.dart';

class QuizDetailsView extends StatelessWidget {
  static const String routeName = '/quiz_details';
  const QuizDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final QuizModel quizModel = GoRouterState.of(context).extra as QuizModel;
    return CustomScaffold(
      body: Provider.value(
        value: quizModel,
        child: BlocProvider(
          create: (context) => getIt<StartStudentsQuizCubit>(),
          child: BlocConsumer<StartStudentsQuizCubit, StartStudentsQuizState>(
            listener: (context, state) {
              state.whenOrNull(
                startStudentsQuizFailure: (error) {
                  showErrorDialog(context, error);
                },
                startStudentsQuizSuccess: (data) {
                  data as quiz.GetQuizByIdResponse;
                  GoRouter.of(context).push(QuizView.routeName, extra: data);
                },
              );
            },
            builder: (context, state) {
              return CustomModalProgress(
                  isLoading: state is StartStudentsQuizLoading,
                  child: const QuizDetailsViewBody());
            },
          ),
        ),
      ),
    );
  }
}
