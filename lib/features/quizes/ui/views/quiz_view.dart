import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_modal_progress.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/core/widgets/show_success_dialog.dart';
import 'package:grad_project/features/quizes/ui/cubit/quiz_cubit/quiz_cubit.dart';
import 'package:grad_project/features/quizes/ui/cubit/quiz_navigation_cubit/quiz_question_navigation_cubit.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/show_error_dialog.dart';
import '../../data/models/get_quiz_using_id_response.dart';
import '../../data/models/submit_quiz_response.dart';
import '../../logic/submit_quiz_cubit/submit_quiz_cubit.dart';
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
          BlocProvider(
            create: (context) => getIt<SubmitQuizCubit>(),
          ),
        ],
        child: Provider.value(
            value: data,
            child: BlocConsumer<SubmitQuizCubit, SubmitQuizState>(
              listener: (context, state) {
                state.whenOrNull(
                  submitQuizFailure: (error) {
                    showErrorDialog(context, error);
                  },
                  submitQuizSuccess: (data) async {
                    data as SubmitQuizResponse;
                    await showSuccessDialog(
                        context: context, message: data.data);
                  },
                );
              },
              builder: (context, state) {
                return CustomModalProgress(
                    isLoading: state is SubmitQuizLoading,
                    child: const QuizViewBody());
              },
            )),
      ),
    );
  }
}
