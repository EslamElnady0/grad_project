import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/features/quizes/logic/delete_quiz_cubit/delete_quiz_cubit.dart';
import 'package:grad_project/features/quizes/logic/get_quizzes_cubit/get_quizzes_cubit.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../data/models/get_quizzes_request_query_params_model.dart';
import '../widgets/teacher_quizzes_view_body.dart';

class TeacherQuizzesView extends StatelessWidget {
  static const String routeName = '/teacher-quizzes-view';
  const TeacherQuizzesView({super.key});

  @override
  Widget build(BuildContext context) {
    final GetQuizzesRequestQueryParamsModel queryParamsModel =
        GoRouterState.of(context).extra as GetQuizzesRequestQueryParamsModel;
    return CustomScaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<GetQuizzesCubit>()
              ..getQuizzes(
                  courseId: queryParamsModel.courseId,
                  quizStatus: queryParamsModel.quizStatus,
                  fromDate: queryParamsModel.fromDate),
          ),
          BlocProvider(
            create: (context) => getIt<DeleteQuizCubit>(),
          ),
        ],
        child: TeacherQuizzesViewBody(
          queryParamsModel: queryParamsModel,
        ),
      ),
    );
  }
}
