import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/assignments/logic/cubits/get_assignments_answers_cubit/get_assignments_answers_cubit.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignments_results_bloc_builder.dart';

class AssignmentResultsView extends StatelessWidget {
  const AssignmentResultsView({super.key});

  static const String routeName = '/assignment-Correction-View';
  @override
  Widget build(BuildContext context) {
    final assignmentId = GoRouterState.of(context).extra as int?;
    return CustomScaffold(
      body: BlocProvider(
        create: (context) => getIt<GetAssignmentsAnswersCubit>()
          ..getAssignmentsAnswers(assignmentId!),
        child: const AssignmentResultsBlocBuilder(),
      ),
    );
  }
}
