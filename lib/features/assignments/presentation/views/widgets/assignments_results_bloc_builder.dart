import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/assignments/logic/cubits/get_assignments_answers_cubit/get_assignments_answers_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/get_assignments_answers_cubit/get_assignments_answers_state.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_results_view_body.dart';

class AssignmentResultsBlocBuilder extends StatelessWidget {
  const AssignmentResultsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAssignmentsAnswersCubit, GetAssignmentsAnswersState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
          getAssignmentsAnswersSuccess: (data) {
            return AssignmentResultsViewBody(assignmentAnswersModel: data);
          },
        );
      },
    );
  }
}
